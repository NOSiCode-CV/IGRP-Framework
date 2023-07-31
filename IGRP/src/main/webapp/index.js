const express = require("express");
const fs = require("fs");
const app = express();

app.get("/page-builder/check-file", (req, res) => {
  const filePath = req.query.path;
  fs.access(__dirname+'/images/IGRP/IGRP2.4/core/formgen/types/'+filePath, fs.constants.F_OK, (err) => {
    if (err) {

      res.json({
        status: false,
        filename: filePath,
        content: "",
      });
    } else {
      fs.readFile(__dirname+'/images/IGRP/IGRP2.4/core/formgen/types/'+filePath, "utf-8", (err, data) => {
        if (err) {
          console.error(`Error reading file '${filePath}': ${err}`);
        } else {
            res.json({
                status: true,
                filename: filePath,
                content: data,
            });
        }
      });
    }
  });
});

app.post('/IGRP/images/IGRP/IGRP2.4/app/igrp/generator/webapps', (req, res) => {
  const data = req.body; // Access the received data

  // Do something with the data...
  console.log('Received data:', data);

  // Send a response
  res.status(200).send('Data received successfully');
});

app.use('/IGRP',express.static("."));

app.listen(3000, () => {
  console.log("Server is running on http://localhost:3000");
});
