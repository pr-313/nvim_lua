return {
    filetypes = { "systemverilog", "verilog", "verilog_systemverilog" },
    cmd = { "verible-verilog-ls",
            "--rules=+endif-comment,+line-length=length:200,-no-trailing-spaces,-plusarg-assignment",
            "--column_limit", "200",
            "--indentation_spaces", "4"
        }
}
