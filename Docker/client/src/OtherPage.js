import React from 'react';
import { Link } from 'react-router-dom';

const OtherPage = () => {
  return (
    <div style={styles.container}>
      <h2 style={styles.heading}>Welcome to Another Page!</h2>
      <p style={styles.text}>
        You've reached another interesting page. Feel free to explore!
      </p>
      <Link to="/" style={styles.link}>
        Go back to the Home Screen
      </Link>
    </div>
  );
};

const styles = {
  container: {
    textAlign: 'center',
    padding: '20px',
    backgroundColor: '#f7f7f7',
    borderRadius: '8px',
    boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)',
  },
  heading: {
    fontSize: '24px',
    color: '#333',
    marginBottom: '16px',
  },
  text: {
    fontSize: '16px',
    color: '#666',
    marginBottom: '24px',
  },
  link: {
    display: 'inline-block',
    padding: '10px 20px',
    backgroundColor: '#4285f4',
    color: '#fff',
    borderRadius: '4px',
    textDecoration: 'none',
    fontWeight: 'bold',
    fontSize: '16px',
    transition: 'background-color 0.3s ease',
  },
};

export default OtherPage;
