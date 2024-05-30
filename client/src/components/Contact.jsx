import React from 'react';

function Contact() {
  return (
    <div className="contact-container">
      <h2 className="contact-title">Contact Us</h2>
      <form className="contact-form">
        <label>
          Name:
          <input type="text" name="name" />
        </label>
        <label>
          Phone:
          <input type="tel" name="phone" />
        </label>
        <label>
          Email:
          <input type="email" name="email" />
        </label>
        <label>
          Message:
          <textarea name="message"></textarea>
        </label>
        <button type="submit">Send</button>
      </form>
      <div className="contact-info">
        <div>
          <span role="img" aria-label="phone">📞</span>
          <p>*6565</p>
        </div>
        <div>
          <span role="img" aria-label="email">📧</span>
          <p>info@tickchak.co.il</p>
        </div>
      </div>
    </div>
  );
}

export default Contact;
