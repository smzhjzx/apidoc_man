var zeta = zeta || {};
zeta.ns = function (ns, func) {
    var object = window;
    var tokens = ns.split('.');
    var token = null;

    while (tokens.length > 0) {
        token = tokens.shift();

        object[token] = object[token] || {};

        if (!tokens.length && !!func) {
            object[token] = func;
        }

        object = object[token];
    }
};

$(document).ready(function () {
    zeta.ns('zeta.json.transform', function (avalonModel) {
        return JSON.parse(JSON.stringify(avalonModel));
    });
});