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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const APIUtil = {\n    followUser: id => {\n        return $.ajax({\n            method: 'POST',\n            url: `/users/${id}/follow`,\n            dataType: 'json',\n        });    \n    },\n\n    unfollowUser: id => {\n        return $.ajax({\n            method: 'DELETE',\n            url: `/users/${id}/follow`,\n            dataType: 'json',\n        });\n    },\n\n};\n\n\n\nmodule.exports = APIUtil;//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4vZnJvbnRlbmQvYXBpX3V0aWwuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUFDQTtBQUNBO0FBQ0E7QUFDQSwyQkFBMkIsR0FBRztBQUM5QjtBQUNBLFNBQVMsRTtBQUNULEtBQUs7O0FBRUw7QUFDQTtBQUNBO0FBQ0EsMkJBQTJCLEdBQUc7QUFDOUI7QUFDQSxTQUFTO0FBQ1QsS0FBSzs7QUFFTDs7OztBQUlBIiwiZmlsZSI6Ii4vZnJvbnRlbmQvYXBpX3V0aWwuanMuanMiLCJzb3VyY2VzQ29udGVudCI6WyJjb25zdCBBUElVdGlsID0ge1xuICAgIGZvbGxvd1VzZXI6IGlkID0+IHtcbiAgICAgICAgcmV0dXJuICQuYWpheCh7XG4gICAgICAgICAgICBtZXRob2Q6ICdQT1NUJyxcbiAgICAgICAgICAgIHVybDogYC91c2Vycy8ke2lkfS9mb2xsb3dgLFxuICAgICAgICAgICAgZGF0YVR5cGU6ICdqc29uJyxcbiAgICAgICAgfSk7ICAgIFxuICAgIH0sXG5cbiAgICB1bmZvbGxvd1VzZXI6IGlkID0+IHtcbiAgICAgICAgcmV0dXJuICQuYWpheCh7XG4gICAgICAgICAgICBtZXRob2Q6ICdERUxFVEUnLFxuICAgICAgICAgICAgdXJsOiBgL3VzZXJzLyR7aWR9L2ZvbGxvd2AsXG4gICAgICAgICAgICBkYXRhVHlwZTogJ2pzb24nLFxuICAgICAgICB9KTtcbiAgICB9LFxuXG59O1xuXG5cblxubW9kdWxlLmV4cG9ydHMgPSBBUElVdGlsOyJdLCJzb3VyY2VSb290IjoiIn0=\n//# sourceURL=webpack-internal:///./frontend/api_util.js\n");

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const APIUtil = __webpack_require__(/*! ./api_util.js */ \"./frontend/api_util.js\");\n\nclass FollowToggle {\n    constructor($el) {\n        this.$el = $($el);\n        this.followState = this.$el.data('initial-follow-state');\n        this.userId = this.$el.data('user-id');\n        this.render();\n        this.handleClick();\n    }\n\n    render (){\n        if(this.followState === false){\n            this.$el.text('Follow!');\n        } else if (this.followState === true) {\n            this.$el.text('Unfollow!');\n        } else if(this.followState === 'disabled') {\n            this.$el.disabled();\n        }\n\n    }\n    handleClick() {\n        const followSuccessCB = (response) => {\n            this.followState = true;\n            this.render();\n        };\n\n        const unfollowSuccessCB = (response) => {\n            this.followState = false;\n            this.render();\n        };\n\n        this.$el.on('click', e => {\n            e.preventDefault();\n            if(this.followState === false) {\n                this.followState = 'disabled';\n                this.render();\n                APIUtil.followUser(this.userId).then(followSuccessCB);\n            } else {\n                this.followState = 'disabled';\n                this.render();\n                APIUtil.unfollowUser(this.userId).then(unfollowSuccessCB);\n            }\n           \n         \n        });\n        \n    }\n}\n\nmodule.exports = FollowToggle;//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4vZnJvbnRlbmQvZm9sbG93X3RvZ2dsZS5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQSxnQkFBZ0IsbUJBQU8sQ0FBQyw2Q0FBZTs7QUFFdkM7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQSxTQUFTO0FBQ1Q7QUFDQSxTQUFTO0FBQ1Q7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsYUFBYTtBQUNiO0FBQ0E7QUFDQTtBQUNBOzs7QUFHQSxTQUFTOztBQUVUO0FBQ0E7O0FBRUEiLCJmaWxlIjoiLi9mcm9udGVuZC9mb2xsb3dfdG9nZ2xlLmpzLmpzIiwic291cmNlc0NvbnRlbnQiOlsiY29uc3QgQVBJVXRpbCA9IHJlcXVpcmUoJy4vYXBpX3V0aWwuanMnKTtcblxuY2xhc3MgRm9sbG93VG9nZ2xlIHtcbiAgICBjb25zdHJ1Y3RvcigkZWwpIHtcbiAgICAgICAgdGhpcy4kZWwgPSAkKCRlbCk7XG4gICAgICAgIHRoaXMuZm9sbG93U3RhdGUgPSB0aGlzLiRlbC5kYXRhKCdpbml0aWFsLWZvbGxvdy1zdGF0ZScpO1xuICAgICAgICB0aGlzLnVzZXJJZCA9IHRoaXMuJGVsLmRhdGEoJ3VzZXItaWQnKTtcbiAgICAgICAgdGhpcy5yZW5kZXIoKTtcbiAgICAgICAgdGhpcy5oYW5kbGVDbGljaygpO1xuICAgIH1cblxuICAgIHJlbmRlciAoKXtcbiAgICAgICAgaWYodGhpcy5mb2xsb3dTdGF0ZSA9PT0gZmFsc2Upe1xuICAgICAgICAgICAgdGhpcy4kZWwudGV4dCgnRm9sbG93IScpO1xuICAgICAgICB9IGVsc2UgaWYgKHRoaXMuZm9sbG93U3RhdGUgPT09IHRydWUpIHtcbiAgICAgICAgICAgIHRoaXMuJGVsLnRleHQoJ1VuZm9sbG93IScpO1xuICAgICAgICB9IGVsc2UgaWYodGhpcy5mb2xsb3dTdGF0ZSA9PT0gJ2Rpc2FibGVkJykge1xuICAgICAgICAgICAgdGhpcy4kZWwuZGlzYWJsZWQoKTtcbiAgICAgICAgfVxuXG4gICAgfVxuICAgIGhhbmRsZUNsaWNrKCkge1xuICAgICAgICBjb25zdCBmb2xsb3dTdWNjZXNzQ0IgPSAocmVzcG9uc2UpID0+IHtcbiAgICAgICAgICAgIHRoaXMuZm9sbG93U3RhdGUgPSB0cnVlO1xuICAgICAgICAgICAgdGhpcy5yZW5kZXIoKTtcbiAgICAgICAgfTtcblxuICAgICAgICBjb25zdCB1bmZvbGxvd1N1Y2Nlc3NDQiA9IChyZXNwb25zZSkgPT4ge1xuICAgICAgICAgICAgdGhpcy5mb2xsb3dTdGF0ZSA9IGZhbHNlO1xuICAgICAgICAgICAgdGhpcy5yZW5kZXIoKTtcbiAgICAgICAgfTtcblxuICAgICAgICB0aGlzLiRlbC5vbignY2xpY2snLCBlID0+IHtcbiAgICAgICAgICAgIGUucHJldmVudERlZmF1bHQoKTtcbiAgICAgICAgICAgIGlmKHRoaXMuZm9sbG93U3RhdGUgPT09IGZhbHNlKSB7XG4gICAgICAgICAgICAgICAgdGhpcy5mb2xsb3dTdGF0ZSA9ICdkaXNhYmxlZCc7XG4gICAgICAgICAgICAgICAgdGhpcy5yZW5kZXIoKTtcbiAgICAgICAgICAgICAgICBBUElVdGlsLmZvbGxvd1VzZXIodGhpcy51c2VySWQpLnRoZW4oZm9sbG93U3VjY2Vzc0NCKTtcbiAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAgdGhpcy5mb2xsb3dTdGF0ZSA9ICdkaXNhYmxlZCc7XG4gICAgICAgICAgICAgICAgdGhpcy5yZW5kZXIoKTtcbiAgICAgICAgICAgICAgICBBUElVdGlsLnVuZm9sbG93VXNlcih0aGlzLnVzZXJJZCkudGhlbih1bmZvbGxvd1N1Y2Nlc3NDQik7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgIFxuICAgICAgICAgXG4gICAgICAgIH0pO1xuICAgICAgICBcbiAgICB9XG59XG5cbm1vZHVsZS5leHBvcnRzID0gRm9sbG93VG9nZ2xlOyJdLCJzb3VyY2VSb290IjoiIn0=\n//# sourceURL=webpack-internal:///./frontend/follow_toggle.js\n");

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ \"./frontend/follow_toggle.js\");\n\n$( () => {\n    const $el = $('.follow-toggle');\n    $el.each((index, el) => new FollowToggle(el));\n});\n\n\n\n\n\n\n\n\n\n\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4vZnJvbnRlbmQvdHdpdHRlci5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQSxxQkFBcUIsbUJBQU8sQ0FBQyx1REFBb0I7O0FBRWpEO0FBQ0E7QUFDQTtBQUNBLENBQUMiLCJmaWxlIjoiLi9mcm9udGVuZC90d2l0dGVyLmpzLmpzIiwic291cmNlc0NvbnRlbnQiOlsiY29uc3QgRm9sbG93VG9nZ2xlID0gcmVxdWlyZSgnLi9mb2xsb3dfdG9nZ2xlLmpzJyk7XG5cbiQoICgpID0+IHtcbiAgICBjb25zdCAkZWwgPSAkKCcuZm9sbG93LXRvZ2dsZScpO1xuICAgICRlbC5lYWNoKChpbmRleCwgZWwpID0+IG5ldyBGb2xsb3dUb2dnbGUoZWwpKTtcbn0pO1xuXG5cblxuXG5cblxuXG5cblxuXG4iXSwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///./frontend/twitter.js\n");

/***/ })

/******/ });