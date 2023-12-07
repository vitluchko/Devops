// App.js
import { Fragment } from "react";
import "./App.css";
import { BrowserRouter as Router, Route, Link, Routes } from "react-router-dom";
import OtherPage from "./OtherPage";
import MainComponent from "./MainComponent";

function App() {
  return (
    <Router>
      <Fragment>
        <header className="header">
          <div className="logo">Multicontainer App</div>
          <nav className="nav-links">
            <Link to="/" className="nav-link">
              Home
            </Link>
            <Link to="/otherpage" className="nav-link">
              Other page
            </Link>
          </nav>
        </header>
        <div className="main">
          <Routes>
            <Route path="/" element={<MainComponent />} />
            <Route path="/otherpage" element={<OtherPage />} />
          </Routes>
        </div>
      </Fragment>
    </Router>
  );
}

export default App;
