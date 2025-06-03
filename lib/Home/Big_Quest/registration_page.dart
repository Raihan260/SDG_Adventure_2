import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String? selectedGender;

  // Date Picker
  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulir Pendaftaran"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Lengkap
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nama Lengkap"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harap masukkan nama";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Nomor Telepon
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Nomor Telepon"),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harap masukkan nomor telepon";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Jenis Kelamin
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: ['Laki-laki', 'Perempuan']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                decoration: const InputDecoration(labelText: "Jenis Kelamin"),
                validator: (value) =>
                    value == null ? "Pilih jenis kelamin" : null,
              ),
              const SizedBox(height: 12),

              // Tanggal Lahir
              TextFormField(
                controller: birthDateController,
                decoration: const InputDecoration(
                  labelText: "Tanggal Lahir",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectBirthDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harap pilih tanggal lahir";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Alamat Lengkap
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: "Alamat Lengkap"),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harap masukkan alamat lengkap";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Kota / Provinsi / Negara
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                    labelText: "Kota / Provinsi / Negara"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harap masukkan wilayah";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Tombol Daftar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Lakukan sesuatu setelah berhasil
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pendaftaran berhasil!')),
                      );
                      Navigator.pop(context); // atau arahkan ke halaman lain
                    }
                  },
                  child: const Text("Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
