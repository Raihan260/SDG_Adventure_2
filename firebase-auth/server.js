const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const authRoutes = require("./routes/authRoutes");
const userDA = require("./data_access/userDA")



const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
app.use("/auth", authRoutes);

// Default route
app.get("/", (req, res) => {
  userDA.getUserByEmail("tes123@gmail.com")
  res.send("API Server Berjalan! Gunakan /auth/register atau /auth/login");
});

app.listen(PORT, () => {
  console.log(`Server berjalan di http://localhost:${PORT}`);
});
