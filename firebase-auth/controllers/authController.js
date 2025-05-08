const { admin, db } = require("../firebase-config");
const bcrypt = require("bcryptjs");

// Generate auto-increment ID untuk user baru
const getNextUserId = async () => {
  const usersRef = db.ref("users");
  const snapshot = await usersRef.orderByChild("id_user").limitToLast(1).once("value");

  let nextId = 1;
  snapshot.forEach(child => {
    nextId = child.val().id_user + 1;
  });

  return nextId;
};

// REGISTER USER
const registerUser = async (req, res) => {
  const { email, username, password } = req.body;
  if (!email || !username || !password) {
    return res.status(400).json({ message: "Semua field harus diisi!" });
  }

  try {
    const usersRef = db.ref("users");
    const snapshot = await usersRef.orderByChild("email").equalTo(email).once("value");

    if (snapshot.exists()) {
      return res.status(400).json({ message: "Email sudah terdaftar!" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    const id_user = await getNextUserId();

    await usersRef.push({
      id_user,
      email,
      username,
      password: hashedPassword,
    });

    return res.status(201).json({ message: "Registrasi berhasil!" });
  } catch (error) {
    return res.status(500).json({ message: "Terjadi kesalahan saat registrasi", error: error.message });
  }
};

// LOGIN USER
const loginUser = async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) {
    return res.status(400).json({ message: "Email dan password harus diisi!" });
  }

  try {
    const usersRef = db.ref("users");
    const snapshot = await usersRef.orderByChild("email").equalTo(email).once("value");

    if (!snapshot.exists()) {
      return res.status(401).json({ message: "Email tidak ditemukan!" });
    }

    let user = null;
    snapshot.forEach(child => {
      user = child.val();
    });

    const passwordMatch = await bcrypt.compare(password, user.password);
    if (!passwordMatch) {
      return res.status(401).json({ message: "Password salah!" });
    }

    return res.status(200).json({
      message: "Login berhasil!",
      user: {
        id_user: user.id_user,
        email: user.email,
        username: user.username,
      }
    });
  } catch (error) {
    return res.status(500).json({ message: "Terjadi kesalahan saat login", error: error.message });
  }
};

module.exports = { registerUser, loginUser };
