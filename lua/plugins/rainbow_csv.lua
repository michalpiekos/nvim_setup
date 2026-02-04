return {
        "mechatroner/rainbow_csv",
        config = function()
                vim.g.rbql_csv_delimiter = ","
                vim.g.rbql_with_headers = 1
        end,
        ft = {
                'csv',
                'tsv',
                'csv_semicolon',
                'csv_whitespace',
                'csv_pipe',
                'rfc_csv',
                'rfc_semicolon'
        },
        cmd = {
                'RainbowDelim',
                'RainbowDelimSimple',
                'RainbowDelimQuoted',
                'RainbowMultiDelim'
        }
}
