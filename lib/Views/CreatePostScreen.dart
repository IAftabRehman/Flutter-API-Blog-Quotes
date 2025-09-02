import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/Elements/CustomTextFieldWidget.dart';
import '../Elements/CustomContainerWidget.dart';
import '../Widgets/AppBarWidget.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();

  XFile? _ownerIdImage;
  final ImagePicker _picker = ImagePicker();
  String? selectedPrimaryCrop;
  final List<String> primaryCrop = [
    "Politics 🏛️",
    "World News 🌍",
    "Local News 📰",
    "Business / Economy 💼",
    "Technology 💻",
    "Science 🔬",
    "Health 🏥",
    "Education 🎓",
    "Environment / Climate 🌱",
    "Sports ⚽🏏🏀",
    "Entertainment 🎬",
    "Lifestyle 👗",
    "Food & Travel 🍔✈️",
    "Culture / Art 🎨",
    "Crime & Law ⚖️",
    "Religion / Spirituality 🕌⛪",
    "Weather 🌦️",
    "Finance / Stock Market 📈",
    "Real Estate / Property 🏠",
    "Opinion / Editorials ✍️",
  ];

  Future<void> _captureOwnerId() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _ownerIdImage = image;
      });
    }
  }

  List<String> tags = [];
  TextEditingController tagController = TextEditingController();
  void addTag() {
    if (tagController.text.isEmpty) return;

    if (tags.length < 3) {
      setState(() {
        tags.add(tagController.text.trim());
        tagController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You can only add up to 3 tags")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MyContainer(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0f0c29), Color(0xFF302b63), Color(0xFF24243e)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              AppBarWidget(
                title: "Daily Stores",
                searchIcon: true,
                profileIcon: true,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _captureOwnerId,
                child: _ownerIdImage == null
                    ? MyContainer(
                        width: double.infinity,
                        height: 150,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.blue),
                        child: Center(
                          child: MyIconContainer(
                            icon: Icons.image,
                            iconColor: Colors.blue,
                            iconSize: 50,
                          ),
                        ),
                      )
                    : Stack(
                        children: [
                          MyContainer(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            border: Border.all(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(_ownerIdImage!.path),
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  _ownerIdImage = null;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: titleController,
                hintText: "Title...",
                textColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                cursorColor: Colors.blue,
                backgroundColor: Colors.transparent,
                textFieldBorder: Border.all(color: Colors.blue),
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: contentController,
                hintText: "Content...",
                maxLines: 10,
                textColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                cursorColor: Colors.blue,
                backgroundColor: Colors.transparent,
                textFieldBorder: Border.all(color: Colors.blue),
              ),
              const SizedBox(height: 10),
              customDropdown("categories", selectedPrimaryCrop, primaryCrop, (
                value,
              ) {
                setState(() {
                  selectedPrimaryCrop = value;
                });
              }),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: tags.map((tag) {
                  return Chip(
                    label: Text(tag),
                    deleteIcon: const Icon(Icons.close),
                    onDeleted: () {
                      setState(() {
                        tags.remove(tag);
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: tagController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Add Tags",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: addTag,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding customDropdown(
    String hintText,
    String? selectedValue,
    List<String> items,
    void Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    style: TextStyle(color: Colors.white),
                    controller: TextEditingController(text: selectedValue),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 30,
                  ),
                  onSelected: onChanged,
                  itemBuilder: (context) => items
                      .map(
                        (item) => PopupMenuItem(value: item, child: Text(item)),
                      )
                      .toList(),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
