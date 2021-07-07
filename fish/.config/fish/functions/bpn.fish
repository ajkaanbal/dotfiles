# Defined in /tmp/fish.5D1Mj1/bpn.fish @ line 2
function bpn
    switch $argv[1]
        case start
            echo "Starting bpn..."
            sudo ipsec start
            sudo swanctl --load-conns --file $HOME/.vpn/bpn.conf
            sudo swanctl --initiate --child home --child home2
        case status
            echo "bpn status.."
            sudo ipsec status
        case stop
            echo "Stoping bpn..."
            sudo ipsec stop
        case '*'
            echo "Usage: bpn [start|status|stop]"
    end
end

complete -c bpn -f
complete -c bpn -a "start status stop"
