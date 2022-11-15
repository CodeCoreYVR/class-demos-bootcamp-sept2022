// Write chatr code here!

// ------------Fetch API---------------------

// routes built into Chatr-Express
//GET /messages
//POST /messages
//PATCH /messages/:id
//DELETE /messages/:id

// GET request
// Calling "fetch" with URL as it's only argument, it will make
// a GET request to that URL. It is asynchronous and returns a promise

fetch("http://localhost:3434/messages")
  // fetch returns an object that represents the HTTP response
  // you can use async methods .text() or .json() on the response
  // to parse it's body. Make sure to return it from the the callback
  .then((response) => response.json())

  // .then(data => console.table(data))
  .then(console.table);

// Create a helper method for messages (requests)
const Message = {
  index() {
    return fetch("/messages").then((res) => res.json());
  },
  // usage:
  // Message.index().then(data => console.table(data))
  create(params) {
    return fetch("/messages", {
      method: "POST",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify(params),
    });
  },
  // usage:
  // Message.create({body: "Hello World"}).then(console.log("message created"))
  destroy(id) {
    return fetch(`/messages/${id}`, { method: "DELETE" });
  },
};

// list of messages

document.addEventListener("DOMContentLoaded", () => {
  const loadMessages = () => {
    const messagesContainer = document.querySelector("#messages");
    Message.index().then((messages) => {
      messagesContainer.innerHTML = messages
        .map((message) => {
          return `
          <li>
            <strong>${message.id}</strong>
            ${message.body}
            <br/>
            <button data-id=${message.id} class="delete-button">Delete</button>
          </li>
        `;
        })
        .join("");
    });
  };

  setInterval(() => {
    loadMessages();
  }, 3000);

  const messageForm = document.querySelector('#new-message')

  messageForm.addEventListener("submit", (event) => {
    event.preventDefault();

    const { currentTarget } = event; //the form element

    //Use FormData to create an object representation
    //of key value pairs of the form that we pass as an argument
    //to the constructor
    const formData = new FormData(currentTarget);

    //formData.get returns the value associated with the given key
    //from within the FormData object

    Message.create({ body: formData.get("body") }).then(() => {
      console.log("Message Created!");
      refreshMessages();
      currentTarget.reset(); //reset empties the form inputs
    });
  });

  messagesUL.addEventListener("click", (event) => {
    const { target } = event; //the element that triggered the event

    if (target.matches(".delete-button")) {
      Message.delete(target.dataset.id).then(() => {
        console.log("Message deleted!");
        refreshMessages();
      });
    }
  });
});
