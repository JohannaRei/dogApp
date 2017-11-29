import React from 'react';
import ReactDOM from 'react-dom';

const dog = {
    name: 'Dog',
    hat: 'tophat',
    face: 'happy',
    body: 'alert',
    woofs: ['woof', 'bark', 'hello'],
};

const hats = ['tophat', 'frilly', 'crown'];
const faces = ['happy', 'angry', 'sad'];
const bodies = ['sitting', 'scared', 'alert'];


const pickNew = (list, oldValue) => {
    let options = [];
    options = list.slice();
    options.splice(list.indexOf(oldValue), 1);
    let newValue = options[Math.floor(Math.random()*options.length)];
    return newValue;
};

const pickHat = () => dog.hat = pickNew(hats, dog.hat);
const pickFace = () => dog.face = pickNew(faces, dog.face);
const pickBody = () => dog.body = pickNew(bodies, dog.body);

const onNameSubmit = (e) => {
    e.preventDefault();
    const dogName = e.target.elements.dogName.value;

    if (dogName) {
        dog.name = dogName;
        e.target.elements.dogName.value = '';
        renderApp();
    }
};

const onBarkSubmit = (e) => {
    e.preventDefault();
    const dogBark = e.target.elements.dogBark.value;

    if (dogBark) {
        dog.woofs.push(dogBark);
        e.target.elements.dogBark.value = '';
        renderApp();
    }
};

const changeHat = () => {
    let dogSvg = document.getElementById('dog-svg').contentDocument;
    dogSvg.getElementById(dog.hat).style.display="none";
    pickHat();
    dogSvg.getElementById(dog.hat).style.display="inline";
    renderApp();
};

const changeFace = () => {
    let dogSvg = document.getElementById('dog-svg').contentDocument;
    dogSvg.getElementById(dog.face).style.display="none";
    pickFace();
    dogSvg.getElementById(dog.face).style.display="inline";
    renderApp();
};

const changeBody = () => {
    let dogSvg = document.getElementById('dog-svg').contentDocument;
    dogSvg.getElementById(dog.body).style.display="none";
    pickBody();
    dogSvg.getElementById(dog.body).style.display="inline";
    renderApp();
};

const appRoot = document.getElementById('app');

const renderApp = () => {
    const docBody = (
        <div>
            <div id="intro">
                <h1>Hello!</h1>
                <p>Welcome to this tiny JS/React/SVG practice application.</p>
                <p>All illustrations and code by <a href="https://jtrein.com" target="_blank"><strong>me</strong></a>!</p>
                <p>The GitHub repository for this project can be found <a href="https://github.com/JohannaRei/dogStyler/" target="_blank">here</a>.</p>
            </div>
            <h4>Enter dog name: </h4>
            <form onSubmit={onNameSubmit}>
              <input type="text" name="dogName"/>
              <button className="btn-default">Name dog</button>
            </form>
            <h3>{dog.name}</h3>
            <object id="dog-svg" width="400" width="310" height="350" type="image/svg+xml" data="/images/dog_base.svg"></object>
            <div id="quote">
                <p><em>"{dog.woofs[Math.floor(Math.random()*dog.woofs.length)]}"</em> T. {dog.name}</p>
            </div>
            <h4>Add a bark: </h4>
            <form onSubmit={onBarkSubmit}>
              <input type="text" name="dogBark"/>
              <button className="btn-default">Add bark</button>
            </form>
            <button onClick={changeHat} className="btn-warning">Change hat</button>
            <button onClick={changeFace} className="btn-warning">Change face</button>
            <button onClick={changeBody} className="btn-warning">Change pose</button>
        </div>
    );

    ReactDOM.render(docBody, app);
};

renderApp();