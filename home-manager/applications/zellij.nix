{ ... }:{
  # programs.zellij = {
  #   enable = true;
  # };

  xdg.configFile."zellij/config.kdl".text = ''
    on_force_close "detach"


    pane_frames false

    theme "gruvbox-dark"

    default_layout "compact"

    mouse_mode true

    copy_on_select true

    scrollback_editor "nvim"

    keybinds {
        unbind "Ctrl q"

        shared {
            unbind "Ctrl g"
            bind "Ctrl b" { SwitchToMode "tmux"; }
            bind "Esc" "q" { ScrollToBottom; SwitchToMode "Normal"; }
        }

        normal clear-defaults=true {
            bind "Ctrl b" { SwitchToMode "tmux"; }
        }

        locked clear-defaults=true {
            bind "Ctrl b" { SwitchToMode "normal"; }
        }

        resize {
            bind "Ctrl n" { SwitchToMode "Normal"; }
            bind "h" "Left" { Resize "Increase Left"; }
            bind "j" "Down" { Resize "Increase Down"; }
            bind "k" "Up" { Resize "Increase Up"; }
            bind "l" "Right" { Resize "Increase Right"; }
            bind "H" { Resize "Decrease Left"; }
            bind "J" { Resize "Decrease Down"; }
            bind "K" { Resize "Decrease Up"; }
            bind "L" { Resize "Decrease Right"; }
            bind "=" "+" { Resize "Increase"; }
            bind "-" { Resize "Decrease"; }
        }

        pane {
            bind "Ctrl a" { SwitchToMode "Normal"; }
            bind "h" "Left" { MoveFocus "Left"; }
            bind "l" "Right" { MoveFocus "Right"; }
            bind "j" "Down" { MoveFocus "Down"; }
            bind "k" "Up" { MoveFocus "Up"; }
            bind "p" { SwitchFocus; }
            bind "n" { NewPane; SwitchToMode "Normal"; }
            bind "d" { NewPane "Down"; SwitchToMode "Normal"; }
            bind "r" { NewPane "Right"; SwitchToMode "Normal"; }
            bind "x" { CloseFocus; SwitchToMode "Normal"; }
            bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
            bind "z" { TogglePaneFrames; SwitchToMode "Normal"; }
            bind "w" { ToggleFloatingPanes; SwitchToMode "Normal"; }
            bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "Normal"; }
            bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0;}
        }

        move {
            bind "Ctrl h" { SwitchToMode "Normal"; }
            bind "n" "Tab" { MovePane; }
            bind "h" "Left" { MovePane "Left"; }
            bind "j" "Down" { MovePane "Down"; }
            bind "k" "Up" { MovePane "Up"; }
            bind "l" "Right" { MovePane "Right"; }
        }

        tab {
            bind "Ctrl t" { SwitchToMode "Normal"; }
            bind "r" { SwitchToMode "RenameTab"; TabNameInput 0; }
            bind "h" "Left" "Up" "k" { GoToPreviousTab; }
            bind "l" "Right" "Down" "j" { GoToNextTab; }
            bind "n" { NewTab; SwitchToMode "Normal"; }
            bind "x" { CloseTab; SwitchToMode "Normal"; }
            bind "s" { ToggleActiveSyncTab; SwitchToMode "Normal"; }
            bind "1" { GoToTab 1; SwitchToMode "Normal"; }
            bind "2" { GoToTab 2; SwitchToMode "Normal"; }
            bind "3" { GoToTab 3; SwitchToMode "Normal"; }
            bind "4" { GoToTab 4; SwitchToMode "Normal"; }
            bind "5" { GoToTab 5; SwitchToMode "Normal"; }
            bind "6" { GoToTab 6; SwitchToMode "Normal"; }
            bind "7" { GoToTab 7; SwitchToMode "Normal"; }
            bind "8" { GoToTab 8; SwitchToMode "Normal"; }
            bind "9" { GoToTab 9; SwitchToMode "Normal"; }
            bind "Tab" { ToggleTab; }
        }

        scroll {
            bind "Ctrl s" { SwitchToMode "Normal"; }
            bind "e" { EditScrollback; SwitchToMode "Normal"; }
            bind "s" { SwitchToMode "EnterSearch"; SearchInput 0; }
            bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
            bind "j" "Down" { ScrollDown; }
            bind "k" "Up" { ScrollUp; }
            bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
            bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }
            // uncomment this and adjust key if using copy_on_select=false
            // bind "Alt c" { Copy; }
        }

        search {
            bind "Ctrl s" { SwitchToMode "Normal"; }
            bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
            bind "j" "Down" { ScrollDown; }
            bind "k" "Up" { ScrollUp; }
            bind "Ctrl d" "PageDown" { PageScrollDown; }
            bind "Ctrl u" "PageUp" { PageScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }
            bind "n" { Search "down"; }
            bind "N" { Search "up"; }
            bind "c" { SearchToggleOption "CaseSensitivity"; }
            bind "w" { SearchToggleOption "Wrap"; }
            bind "o" { SearchToggleOption "WholeWord"; }
            bind "Space" { SwitchToMode "EnterSearch"; SearchInput 0; }
        }

        entersearch {
            unbind "q"
            bind "Ctrl c" "Esc" "Enter" { SwitchToMode "Search"; }
        }

        renametab {
            bind "Ctrl c" { UndoRenameTab; SwitchToMode "Normal"; }
            bind "Esc" { UndoRenameTab; SwitchToMode "Tab"; }
        }

        renamepane {
            bind "Ctrl c" { UndoRenamePane; SwitchToMode "Normal"; }
            bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
        }

        session {
            bind "Ctrl x" { SwitchToMode "Normal"; }
            bind "Ctrl x" { SwitchToMode "Scroll"; }
            bind "d" { Detach; }
            bind "w" {
                LaunchOrFocusPlugin "zellij:session-manager" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "Normal"
            }
        }

        tmux clear-defaults=true {
            bind "Ctrl b" "Enter" "Esc" { SwitchToMode "normal"; }
            bind "Alt [" { PreviousSwapLayout; }
            bind "Alt ]" { NextSwapLayout; }
            bind "g" { SwitchToMode "locked"; }
            bind "a" { SwitchToMode "pane"; }
            bind "t" { SwitchToMode "tab"; }
            bind "n" { SwitchToMode "resize"; }
            bind "m" { SwitchToMode "move"; }
            bind "Space" { SwitchToMode "search"; }
            bind "s" { SwitchToMode "session"; }
            bind "z" { SwitchToMode "scroll"; }

            bind "o" { FocusNextPane; }
            bind "d" { Detach; }
            bind "q" { Quit; }

            // tab
            bind "Tab" { GoToNextTab; }
            bind "Ctrl n" { NewTab; SwitchToMode "Normal"; }
            bind "1" { GoToTab 1; SwitchToMode "Normal"; }
            bind "2" { GoToTab 2; SwitchToMode "Normal"; }
            bind "3" { GoToTab 3; SwitchToMode "Normal"; }
            bind "4" { GoToTab 4; SwitchToMode "Normal"; }
            bind "5" { GoToTab 5; SwitchToMode "Normal"; }
            bind "6" { GoToTab 6; SwitchToMode "Normal"; }
            bind "7" { GoToTab 7; SwitchToMode "Normal"; }
            bind "8" { GoToTab 8; SwitchToMode "Normal"; }
            bind "9" { GoToTab 9; SwitchToMode "Normal"; }

            // pane
            bind "h" { MoveFocus "Left"; }
            bind "l" { MoveFocus "Right"; }
            bind "j" { MoveFocus "Down"; }
            bind "k" { MoveFocus "Up"; }
            bind "x" { CloseFocus; SwitchToMode "Normal"; }
            bind "Ctrl x" { CloseFocus; }
            bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
        }
    }

    themes {
        gruvbox-dark {
            fg 235 219 178 // fg1
            bg 40 40 40 // bg0
            black 60 56 54 // bg1
            red 204 36 29
            green 152 151 26
            yellow 215 153 33
            blue 69 133 136
            magenta 177 98 134
            cyan 104 157 106
            white 251 241 199 // fg0
            orange 214 93 14
        }
    }
  '';
}
