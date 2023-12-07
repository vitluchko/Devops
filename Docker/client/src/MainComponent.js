import React, { useCallback, useState, useEffect } from "react";
import axios from "axios";
import "./MainComponent.css";

const MainComponent = () => {
  const [values, setValues] = useState([]);
  const [value, setValue] = useState("");

  const getAllNumbers = useCallback(async () => {
    try {
      const response = await axios.get("/api/values/all");
      setValues(response.data.rows.map((row) => row.number));
    } catch (error) {
      console.error("Error fetching numbers:", error);
    }
  }, []);

  const saveNumber = useCallback(
    async (event) => {
      event.preventDefault();

      try {
        await axios.post("/api/values", {
          value,
        });

        setValue("");
        getAllNumbers();
      } catch (error) {
        console.error("Error saving number:", error);
      }
    },
    [value, getAllNumbers]
  );

  useEffect(() => {
    getAllNumbers();
  }, [getAllNumbers]);

  return (
    <div className="main-component">
      <button className="action-button" onClick={getAllNumbers}>
        Get all numbers
      </button>
      <div className="title">Values</div>
      <div className="values">
        {values.map((value, index) => (
          <div key={index} className="value">
            {value}
          </div>
        ))}
      </div>
      <form className="form" onSubmit={saveNumber}>
        <label htmlFor="valueInput" className="form-label">
          Enter your value:
        </label>
        <div className="form-input-container">
          <input
            id="valueInput"
            type="text"
            value={value}
            onChange={(event) => setValue(event.target.value)}
            className="form-input"
          />
          <button type="submit" className="action-button form-submit-button">
            Submit
          </button>
        </div>
      </form>
    </div>
  );
};

export default MainComponent;
