local crates = require('crates')

crates.setup {
    smart_insert = true, -- try to be smart about inserting versions
    avoid_prerelease = true, -- don't select a prerelease if the requirement does not have a suffix
    autoload = true, -- automatically run update when opening a Cargo.toml
    autoupdate = true, -- automatically update when editing text
    loading_indicator = true, -- show a loading indicator while fetching crate versions
    date_format = "%Y-%m-%d", -- the date format passed to os.date
    text = {
        loading    = "   Loading",
        version    = "   %s",
        prerelease = "   %s",
        yanked     = "   %s",
        nomatch    = "   No match",
        upgrade    = "   %s",
        error      = "   Error fetching crate",
    },
    highlight = {
        loading    = "CratesNvimLoading",
        version    = "CratesNvimVersion",
        prerelease = "CratesNvimPreRelease",
        yanked     = "CratesNvimYanked",
        nomatch    = "CratesNvimNoMatch",
        upgrade    = "CratesNvimUpgrade",
        error      = "CratesNvimError",
    },
    popup = {
        autofocus = false, -- focus the versions popup when opening it
        copy_register = '"', -- the register into which the version will be copied
        style = "minimal", -- same as nvim_open_win config.style
        border = "none", -- same as nvim_open_win config.border
        version_date = false, -- display when a version was released
        max_height = 30,
        min_width = 20,
        text = {
            title      = "  %s ",
            -- versions
            version    = "   %s ",
            prerelease = "  %s ",
            yanked     = "  %s ",
            -- features
            feature    = "   %s ",
            enabled    = "  %s ",
            transitive = "  %s ",
            date       = " %s ",
        },
        highlight = {
            title      = "CratesNvimPopupTitle",
            -- versions
            version    = "CratesNvimPopupVersion",
            prerelease = "CratesNvimPopupPreRelease",
            yanked     = "CratesNvimPopupYanked",
            -- features
            feature    = "CratesNvimPopupFeature",
            enabled    = "CratesNvimPopupEnabled",
            transitive = "CratesNvimPopupTransitive",
        },
        keys = {
            hide = { "q", "<esc>" },
            -- versions
            select = { "<cr>" },
            select_dumb = { "s" },
            copy_version = { "yy" },
            -- features
            toggle_feature = { "<cr>" },
            goto_feature = { "gd", "K" },
            jump_forward_feature = { "<c-i>" },
            jump_back_feature = { "<c-o>" },
        },
    },
    cmp = {
        text = {
            prerelease = "  pre-release ",
            yanked     = "  yanked ",
        },
    },
}

