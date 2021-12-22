String getImage(String name, {bool darkMode = false, String sub = "layers"}) => "assets/images/$sub/${darkMode ? "dark" : "light"}/$name";
