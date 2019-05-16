const DOMNodeCollection = require('./dom_node_collection.js');

function $l(selector) {
    if(selector instanceof HTMLElement) {
       return new DOMNodeCollection([selector]);
    } else {
        const NodeList = Array.from(document.querySelectorAll(selector));
        return new DOMNodeCollection(NodeList);
    }
}

window.$l = $l;