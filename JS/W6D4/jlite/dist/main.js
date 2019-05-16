/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n    constructor(HTMLElements){\n        this.HTMLElements = HTMLElements;\n    }\n\n    html(string = null){\n        if (string){\n            this.HTMLElements.forEach( el => {\n                el.innerHTML = string;\n            });\n        }   else {\n            return this.HTMLElements[0].innerHTML;\n        }  \n    }\n\n    empty() {\n        this.HTMLElements.forEach(el => {\n            el.innerHTML = \"\";\n        });\n    }\n\n    append(args){\n        \n        this.HTMLElements.forEach(ele => {\n            if(args instanceof DOMNodeCollection) {\n                for(let i = 0; i < args.HTMLElements.length; i++){\n                    // args.each(arg => {\n                        return ele.innerHTML += args.HTMLElements[i].outerHTML;\n                    // });\n                }\n            } else {\n                return ele.innerHTML += args;\n            }\n        });\n    }\n\n    addClass(string) {\n        this.HTMLElements.forEach(ele => {\n            ele.className = ele.className || string;\n        });\n    }\n\n    removeClass(string) {\n        this.HTMLElements.forEach(ele => {\n            if (!string) {\n                ele.className = \"\";\n            } else if(ele.className === string) {\n                ele.className = \"\";\n            }\n        });\n    }\n\n    attr(attributeName, value) {\n\n        for (let i = 0; i < this.HTMLElements.length; i++) {\n            const ele = this.HTMLElements[i];\n\n            if(!value){\n                if (ele.hasAttribute(attributeName)){\n                    return ele.getAttribute(attributeName);\n                }\n            } else {\n                ele.setAttribute(attributeName, value);\n            }\n        }\n    }\n    \n    children(selector) {\n        let babies = [];\n        for (let i = 0; i < this.HTMLElements.length; i++) {\n            const ele = this.HTMLElements[i];\n            if(selector) {\n                babies.push(ele.querySelectorAll(selector));\n            } else { \n                babies.push(ele.children);\n            }\n        }\n\n        return new DOMNodeCollection(babies);\n    }\n\n    parent(selector) {\n        let parents = [];\n        for (let i = 0; i < this.HTMLElements.length; i++){\n            const ele = this.HTMLElements[i];\n            if(selector){\n\n            } else {\n                parents.push(ele.parentNode);\n            }\n        }\n\n        return new DOMNodeCollection(parents);\n    }\n\n }\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nfunction $l(selector) {\n    if(selector instanceof HTMLElement) {\n       return new DOMNodeCollection([selector]);\n    } else {\n        const NodeList = Array.from(document.querySelectorAll(selector));\n        return new DOMNodeCollection(NodeList);\n    }\n}\n\nwindow.$l = $l;\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });