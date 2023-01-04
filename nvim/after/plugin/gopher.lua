import("gopher", function(gopher)
    gopher.setup {
        commands = {
            go = "go",
            gomodifytags = "gomodifytags",
            gotests = "gotests",
            impl = "impl",
            iferr = "iferr",
        },
    }
end)
