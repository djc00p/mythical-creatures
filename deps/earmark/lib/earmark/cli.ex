defmodule Earmark.CLI do

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  @args """
  usage:

     earmark --help
     earmark --version
     earmark [ options... <file> ]

  convert file from Markdown to HTML.

     where options can be any of:
       --code-class-prefix <a prefix>
       --gfm
       --smartypants
       --pedantic
       --pure-links
       --breaks
       --timeout <timeout in ms>

  """

  @cli_options [:code_class_prefix, :gfm, :smartypants, :pedantic, :pure_links, :breaks, :timeout]

  defp parse_args(argv) do
    switches = [
      help: :boolean,
      version: :boolean
      ]
    aliases = [
      h: :help,
      v: :version
    ]

    parse = OptionParser.parse(argv, switches: switches, aliases: aliases)
    case  parse  do
      { [ {switch, true } ],  _, _ } -> switch
      { options, [ filename ],  _ }  -> {open_file(filename), filename, options}
      { options, [ ],           _ }  -> {:stdio, "<no file>", options}
      _                              -> :help
    end
  end


  defp process(:help) do
    IO.puts(:stderr, @args)
    IO.puts(:stderr, option_related_help())
  end

  defp process(:version) do
    IO.puts( Earmark.version() )
  end

  defp process({io_device, filename, options}) do
    options = struct(Earmark.Options,
                 booleanify(options) |> numberize_options([:timeout]) |> add_filename(filename))

    content = IO.stream(io_device, :line) |> Enum.to_list
    Earmark.as_html!(content, options)
    |> IO.puts
  end

  defp add_filename(options, filename),
    do: [{:file, filename} | options]


  defp booleanify( keywords ), do: Enum.map(keywords, &booleanify_option/1)
  defp booleanify_option({k, v}) do
    {k,
     case Map.get %Earmark.Options{}, k, :does_not_exist do
        true  -> if v == "false", do: false, else: true
        false -> if v == "false", do: false, else: true
        :does_not_exist ->
          IO.puts( :stderr, "ignoring unsupported option #{inspect k}")
          v
        _     -> v
      end
    }
  end

  defp numberize_options(keywords, option_names), do: Enum.map(keywords, &numberize_option(&1, option_names))
  defp numberize_option({k, v}, option_names) do
    if Enum.member?(option_names, k) do
      case Integer.parse(v) do
        {int_val, ""}   -> {k, int_val}
        {int_val, rest} -> IO.puts(:stderr, "Warning, non numerical suffix in option #{k} ignored (#{inspect rest})")
                           {k, int_val}
        :error          -> IO.puts(:stderr, "ERROR, non numerical value #{v} for option #{k} ignored, value is set to nil")
                           {k, nil}
      end
    else
      {k, v}
    end
  end

  defp open_file(filename), do: io_device(File.open(filename, [:utf8]), filename)

  defp io_device({:ok, io_device}, _), do: io_device
  defp io_device({:error, reason}, filename) do
    IO.puts(:stderr, "#{filename}: #{:file.format_error(reason)}")
    exit(1)
  end

  defp option_related_help do
    @cli_options
    |> Enum.map(&specific_option_help/1)
    |> Enum.join("\n")
  end

  defp specific_option_help(option) do
    "      --#{unixize_option(option)} defaults to #{inspect(Map.get(%Earmark.Options{}, option))}"
  end

  defp unixize_option(option) do
    "#{option}"
    |> String.replace("_", "-")
  end

end

# SPDX-License-Identifier: Apache-2.0
