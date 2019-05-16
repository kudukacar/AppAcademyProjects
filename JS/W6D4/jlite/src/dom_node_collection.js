class DOMNodeCollection {
    constructor(HTMLElements){
        this.HTMLElements = HTMLElements;
    }

    html(string = null){
        if (string){
            this.HTMLElements.forEach( el => {
                el.innerHTML = string;
            });
        }   else {
            return this.HTMLElements[0].innerHTML;
        }  
    }

    empty() {
        this.HTMLElements.forEach(el => {
            el.innerHTML = "";
        });
    }

    append(args){
        
        this.HTMLElements.forEach(ele => {
            if(args instanceof DOMNodeCollection) {
                for(let i = 0; i < args.HTMLElements.length; i++){
                    // args.each(arg => {
                        return ele.innerHTML += args.HTMLElements[i].outerHTML;
                    // });
                }
            } else {
                return ele.innerHTML += args;
            }
        });
    }

    addClass(string) {
        this.HTMLElements.forEach(ele => {
            ele.className = ele.className || string;
        });
    }

    removeClass(string) {
        this.HTMLElements.forEach(ele => {
            if (!string) {
                ele.className = "";
            } else if(ele.className === string) {
                ele.className = "";
            }
        });
    }

    attr(attributeName, value) {

        for (let i = 0; i < this.HTMLElements.length; i++) {
            const ele = this.HTMLElements[i];

            if(!value){
                if (ele.hasAttribute(attributeName)){
                    return ele.getAttribute(attributeName);
                }
            } else {
                ele.setAttribute(attributeName, value);
            }
        }
    }
    
    children(selector) {
        let babies = [];
        for (let i = 0; i < this.HTMLElements.length; i++) {
            const ele = this.HTMLElements[i];
            if(selector) {
                babies.push(ele.querySelectorAll(selector));
            } else { 
                babies.push(ele.children);
            }
        }

        return new DOMNodeCollection(babies);
    }

    parent(selector) {
        let parents = [];
        for (let i = 0; i < this.HTMLElements.length; i++){
            const ele = this.HTMLElements[i];
            if(selector){

            } else {
                parents.push(ele.parentNode);
            }
        }

        return new DOMNodeCollection(parents);
    }

 }

module.exports = DOMNodeCollection;