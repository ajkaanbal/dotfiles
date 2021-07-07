# Defined interactively
function cleanpods
k get po --no-headers=true --field-selector status.phase!=Running | awk '{print $1}' | xargs -I{} -t -P8 kubectl delete po {}
end
