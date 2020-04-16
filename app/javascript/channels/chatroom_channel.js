// app/javascript/channels/chatroom_channel.js
import consumer from "./consumer";

const messagesContainer = document.getElementById("messages");
const userId = messagesContainer.dataset["currentUser"]
const input = document.querySelector('#message_content');

const styling = (bloc, id) => {
    if (bloc.dataset["userId"] === id) {
      bloc.classList.add("message");
      bloc.querySelector(".content").classList.add("message-content");
      bloc.querySelector(".text").classList.add("right-text");
    } else {
      bloc.classList.add("message-left");
      bloc.querySelector(".content").classList.add("message-content-left");
      bloc.querySelector(".text").classList.add("left-text");
    }
  };

if (messagesContainer) {
  const id = messagesContainer.dataset.chatroomId;

  consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
    received(data) {
      messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      let blocs = messagesContainer.querySelectorAll(".bloc");
      let last = blocs[blocs.length - 1];
      styling(last, userId);
    }
  });
}
