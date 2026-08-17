import React, { useEffect, useState } from "react";
import axios from "axios";

function App() {

  const [data, setData] = useState("");

  useEffect(() => {
    axios.get("http://localhost:5000")
      .then(res => {
        setData(res.data);
      });
  }, []);

  return (
    <div>
      <h1>3 Tier Application</h1>
      <h2>{data}</h2>
    </div>
  );
}

export default App;