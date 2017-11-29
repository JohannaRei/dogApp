'use strict';

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _reactDom = require('react-dom');

var _reactDom2 = _interopRequireDefault(_reactDom);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

var dog = {
    name: 'Dog',
    hat: 'tophat',
    face: 'happy',
    body: 'alert',
    woofs: ['woof', 'bark', 'hello']
};

var hats = ['tophat', 'frilly', 'crown'];
var faces = ['happy', 'angry', 'sad'];
var bodies = ['sitting', 'scared', 'alert'];

var pickNew = function pickNew(list, oldValue) {
    var options = [];
    options = list.slice();
    options.splice(list.indexOf(oldValue), 1);
    var newValue = options[Math.floor(Math.random() * options.length)];
    return newValue;
};

var pickHat = function pickHat() {
    return dog.hat = pickNew(hats, dog.hat);
};
var pickFace = function pickFace() {
    return dog.face = pickNew(faces, dog.face);
};
var pickBody = function pickBody() {
    return dog.body = pickNew(bodies, dog.body);
};

var onNameSubmit = function onNameSubmit(e) {
    e.preventDefault();
    var dogName = e.target.elements.dogName.value;

    if (dogName) {
        dog.name = dogName;
        e.target.elements.dogName.value = '';
        renderApp();
    }
};

var onBarkSubmit = function onBarkSubmit(e) {
    e.preventDefault();
    var dogBark = e.target.elements.dogBark.value;

    if (dogBark) {
        dog.woofs.push(dogBark);
        e.target.elements.dogBark.value = '';
        renderApp();
    }
};

var changeHat = function changeHat() {
    var dogSvg = document.getElementById('dog-svg').contentDocument;
    dogSvg.getElementById(dog.hat).style.display = "none";
    pickHat();
    dogSvg.getElementById(dog.hat).style.display = "inline";
    renderApp();
};

var changeFace = function changeFace() {
    var dogSvg = document.getElementById('dog-svg').contentDocument;
    dogSvg.getElementById(dog.face).style.display = "none";
    pickFace();
    dogSvg.getElementById(dog.face).style.display = "inline";
    renderApp();
};

var changeBody = function changeBody() {
    var dogSvg = document.getElementById('dog-svg').contentDocument;
    dogSvg.getElementById(dog.body).style.display = "none";
    pickBody();
    dogSvg.getElementById(dog.body).style.display = "inline";
    renderApp();
};

var appRoot = document.getElementById('app');

var renderApp = function renderApp() {
    var _React$createElement;

    var docBody = _react2.default.createElement(
        'div',
        null,
        _react2.default.createElement(
            'div',
            { id: 'intro' },
            _react2.default.createElement(
                'h1',
                null,
                'Hello!'
            ),
            _react2.default.createElement(
                'p',
                null,
                'Welcome to this tiny JS/React/SVG practice application.'
            ),
            _react2.default.createElement(
                'p',
                null,
                'All illustrations and code by ',
                _react2.default.createElement(
                    'a',
                    { href: 'https://jtrein.com', target: '_blank' },
                    _react2.default.createElement(
                        'strong',
                        null,
                        'me'
                    )
                ),
                '!'
            ),
            _react2.default.createElement(
                'p',
                null,
                'The GitHub repository for this project can be found ',
                _react2.default.createElement(
                    'a',
                    { href: 'https://github.com/JohannaRei/dogStyler/', target: '_blank' },
                    'here'
                ),
                '.'
            )
        ),
        _react2.default.createElement(
            'h4',
            null,
            'Enter dog name: '
        ),
        _react2.default.createElement(
            'form',
            { onSubmit: onNameSubmit },
            _react2.default.createElement('input', { type: 'text', name: 'dogName' }),
            _react2.default.createElement(
                'button',
                { className: 'btn-default' },
                'Name dog'
            )
        ),
        _react2.default.createElement(
            'h3',
            null,
            dog.name
        ),
        _react2.default.createElement('object', (_React$createElement = { id: 'dog-svg', width: '400' }, _defineProperty(_React$createElement, 'width', '310'), _defineProperty(_React$createElement, 'height', '350'), _defineProperty(_React$createElement, 'type', 'image/svg+xml'), _defineProperty(_React$createElement, 'data', '/images/dog_base.svg'), _React$createElement)),
        _react2.default.createElement(
            'div',
            { id: 'quote' },
            _react2.default.createElement(
                'p',
                null,
                _react2.default.createElement(
                    'em',
                    null,
                    '"',
                    dog.woofs[Math.floor(Math.random() * dog.woofs.length)],
                    '"'
                ),
                ' T. ',
                dog.name
            )
        ),
        _react2.default.createElement(
            'h4',
            null,
            'Add a bark: '
        ),
        _react2.default.createElement(
            'form',
            { onSubmit: onBarkSubmit },
            _react2.default.createElement('input', { type: 'text', name: 'dogBark' }),
            _react2.default.createElement(
                'button',
                { className: 'btn-default' },
                'Add bark'
            )
        ),
        _react2.default.createElement(
            'button',
            { onClick: changeHat, className: 'btn-warning' },
            'Change hat'
        ),
        _react2.default.createElement(
            'button',
            { onClick: changeFace, className: 'btn-warning' },
            'Change face'
        ),
        _react2.default.createElement(
            'button',
            { onClick: changeBody, className: 'btn-warning' },
            'Change pose'
        )
    );

    _reactDom2.default.render(docBody, app);
};

renderApp();
