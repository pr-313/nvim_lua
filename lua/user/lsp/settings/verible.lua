return {
    filetypes = { "systemverilog", "verilog", "verilog_systemverilog" },
    cmd = { "verible-verilog-ls",
            "--rules=+endif-comment,+line-length=length:160,-no-trailing-spaces,-plusarg-assignment",
            "--column_limit", "160",
            "--indentation_spaces", "4"
        }
}
