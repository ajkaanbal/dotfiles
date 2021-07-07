# Defined in /tmp/fish.sOnGn1/beam.fish @ line 2
function beam --on-event fish_postexec --on-event fish_focus_in
    echo -ne "\e[6 q"
end
