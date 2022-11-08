if (false) {
  document.addEventListener("click", (event) => {
    console.log("target", event.target);
    // event.target is the DOM Node that triggered this event.
    // It does not have to be the node that has the event
    console.log("currentTarget", event.currentTarget);
    // event.currentTarget is the node that owns this event
    console.log(this);
    console.log(event);
    console.log("Document was clicked");
  });
}

// const toxicTim = document.getElementById("toxic-tim");
// toxicTim.addEventListener("click", (event) => {
//   console.log("Toxic Tim was clicked");
//   console.log(event.currentTarget);
//   console.log(event.target);
//   console.log(event.clientX, event.clientY);
// });

// const doggoName = document.querySelectorAll(".doggo.fighter h1");
// doggoName.forEach((node) => {
//   node.addEventListener("click", (event) => {
//     console.log("Doggo was clicked");
//   });
// });

// console.log(document instanceof Node);
// console.log("a string" instanceof Node);

// console.log(document.querySelector('div') instanceof Node) // true
// console.log(document.querySelectorAll('div') instanceof Node) // false
// console.log(document.querySelectorAll('div')[0] instanceof Node) // true

// const teamSalmon = document.querySelector(".team.salmon")
// teamSalmon.addEventListener("click", function (event) {
//   console.log(this);
//   console.log(event.currentTarget);
// })

const allDoggos = document.querySelectorAll(".doggo.fighter")

// allDoggos.forEach(doggoNode => {
//   doggoNode.addEventListener("click", event => {
//     const clickedElement = event.currentTarget;
//     const rosterNode = clickedElement.closest(".roster");
//     rosterNode.append(clickedElement);
//   })
// })

allDoggos.forEach((doggoNode) => {
  doggoNode.addEventListener("dblclick", (event) => {
    event.currentTarget.classList.toggle("inverted")
  })
})
allDoggos.forEach((doggoNode) => {
  doggoNode.addEventListener("mousedown", (event) => {
    event.currentTarget.classList.add("flipped")
  })
})
allDoggos.forEach((doggoNode) => {
  doggoNode.addEventListener("mouseup", (event) => {
    event.currentTarget.classList.remove("flipped")
  })
})
allDoggos.forEach((doggoNode) => {
  doggoNode.addEventListener("mouseenter", (event) => {
    event.currentTarget.classList.add("inverted")
  })
})
allDoggos.forEach((doggoNode) => {
  doggoNode.addEventListener("mouseleave", (event) => {
    event.currentTarget.classList.remove("inverted")
  })
})

const bottomDiv = document.createElement('div')
bottomDiv.style.position = "absolute"
bottomDiv.style.position = "0"
bottomDiv.style.backgroundColor = "white"
document.body.append(bottomDiv)

document.addEventListener("mousemove", event => {
  const position = `${event.x}, ${event.y}`
  bottomDiv.innerText = position
})

const keySound = new Audio("sounds/vintage-keyboard-1.wav")
const inputs = document.querySelectorAll("input")
inputs.forEach((inputNode) => {
  inputNode.addEventListener("input", (event) => {
    // keySound.play()
  })
})

const explosionSound = new Audio("sounds/small-explosion.wav")
const submitForm = document.querySelector("form")
submitForm.addEventListener("submit", (event) => {
  event.preventDefault()
  // explosionSound.play()
})

const applicantPreview = document.querySelector("#applicant-preview")

const pictureInput = document.querySelector("input[name=picture-url]")

pictureInput.addEventListener("input", event => {
  const imageUrl = event.currentTarget.value
  applicantPreview.style.backgroundImage = `url(${imageUrl})`
})

// shorcuts of the ninja

let lettersTyped = ''

document.addEventListener("keypress", event => {
  // console.log(event.key);
  lettersTyped += event.key
  if (lettersTyped === "panic") {
    window.location.href = "http://hackertyper.net"
  }
})

// nyan cat

document.addEventListener("keydown", function (event) {
  console.log(event);
  const {
    currentTarget,
    target,
    altKey,
    shiftKey,
    metaKey,
    key,
  } = event
  

  if (altKey && shiftKey && key === "N") {
    window.location.href = "http://nyan.cat"
  }
})

// Run Script
document.addEventListener("DOMContentLoaded", function (event) {
  console.log("The page has loaded");
})










