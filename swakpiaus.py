import sys
import time
import os
import distro  # To detect the Linux distribution
import subprocess  # To run bash files
from PyQt5.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget, QComboBox, QPushButton, QLabel, QListWidget, QListWidgetItem, QCheckBox, QHBoxLayout
from PyQt5.QtCore import Qt
from PyQt5.QtGui import QIcon, QPixmap
from PyQt5.QtGui import QFont

class LinuxApp(QMainWindow):
    def __init__(self):
        super().__init__()

        # Set window size
        self.setWindowTitle("SWAKPIAUS 1.0.5 - By WaffleCode Labs")
        self.setGeometry(100, 100, 1280, 720)
        pixmap = QPixmap("bin/icons/SWAKPIAUS_Logo.png")
        pixmap = pixmap.scaled(64, 64, Qt.KeepAspectRatio, Qt.SmoothTransformation)  # Resize to 64x64 pixels
        self.setWindowIcon(QIcon(pixmap))

        # Main widget and layout
        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)

        self.layout = QVBoxLayout()

        # Detect current Linux distribution and desktop environment
        current_distro = distro.id()
        linux_version = distro.version()
        desktop_env = os.environ.get('XDG_CURRENT_DESKTOP', 'Unknown')

        # Create a combo box with Linux distributions
        self.distro_combo = QComboBox()
        linux_distros = ["ubuntu", "debian", "fedora", "arch"] # "centos", "manjaro", "opensuse" are not supported yet.

        recommended_index = 0  # Store the index of the recommended distro

        for i, distro_name in enumerate(linux_distros):
            if distro_name == current_distro:
                self.distro_combo.addItem(f"{distro_name.capitalize()} (Your Distribution/Recommended)")
                recommended_index = i  # Save the index of the recommended distro
            else:
                self.distro_combo.addItem(distro_name.capitalize())

        # Auto-select the recommended distro
        self.distro_combo.setCurrentIndex(recommended_index)
        self.distro_combo.currentIndexChanged.connect(self.update_package_list)

        self.layout.addWidget(QLabel("Select your Linux distribution:"))
        self.layout.addWidget(self.distro_combo)

        # Create a list widget for package selection
        self.package_list = QListWidget()
        package_options = ["SomeWaffles Recommended", "JackIVs Recommended", "Nvidia Driver Install Only", "Basic", "Small", "Large"]

        # Store the package options to display in the list
        self.package_options = package_options

        # Add the package list to the layout
        self.layout.addWidget(QLabel("Select your package:"))
        self.layout.addWidget(self.package_list)

        # Create a layout for the advanced options and Linux information
        advanced_layout = QHBoxLayout()

        # Create a checkbox for Advanced options
        self.advanced_checkbox = QCheckBox("Show Extra Big/Extremely Small Packages")
        self.advanced_checkbox.stateChanged.connect(self.toggle_advanced_options)
        advanced_layout.addWidget(self.advanced_checkbox)

        # Add a label to display the Linux version and desktop environment
        self.linux_info_label = QLabel(f"Version: {current_distro} {linux_version}, Desktop: {desktop_env}")
        advanced_layout.addWidget(self.linux_info_label)

        # Add the advanced layout to the main layout
        self.layout.addLayout(advanced_layout)

        # Add hidden advanced entries (initially hidden)
        self.advanced_options = ["Micro", "Extra Small", "Extra Large"]
        self.show_advanced = False  # Tracks whether advanced options are shown

        # Populate the list with the initial distribution and package combination
        self.update_package_list()

        # Add a few buttons
        self.installbutton = QPushButton("Start Installing!")
        self.installbutton.clicked.connect(self.run_install_script)

        self.closeappbutton = QPushButton("Cancel")
        self.closeappbutton.clicked.connect(self.closeapp)
        self.closeappbutton.setText("Cancel")

        # Add buttons to the layout
        self.layout.addWidget(self.installbutton)
        self.layout.addWidget(self.closeappbutton)

        # Set layout to central widget
        self.central_widget.setLayout(self.layout)

    def toggle_advanced_options(self, state):
        """Toggles the visibility of advanced options when the checkbox is clicked."""
        if state == Qt.Checked:
            self.show_advanced = True
        else:
            self.show_advanced = False
        self.update_package_list()

    def update_package_list(self):
        """Updates the QListWidget to show 'Distro - Package' for each package size."""
        # Get the currently selected Linux distro
        current_distro = self.distro_combo.currentText().replace(" (Your Distribution/Recommended)", "")
        
        # Clear the current list
        self.package_list.clear()

        # Set a larger font for the list items
        font = QFont()
        font.setPointSize(14)  # Set font size to 14

        # Add each package size to the list, combined with the current distro
        for package in self.package_options:
            list_item = QListWidgetItem(f"{current_distro} - {package}")
            list_item.setFont(font)  # Apply the larger font

            # Set the icon for the Nvidia Driver install only package
            if package == "Nvidia Driver Install Only":
                icon_path = "bin/icons/nvidia_icon.png"
                if os.path.exists(icon_path):
                    pixmap = QPixmap(icon_path)
                    pixmap = pixmap.scaled(64, 64, Qt.KeepAspectRatio, Qt.SmoothTransformation)  # Resize to 64x64 pixels
                    list_item.setIcon(QIcon(pixmap))

            if package == "Basic":
                icon_path = "bin/icons/star.png"
                if os.path.exists(icon_path):
                    pixmap = QPixmap(icon_path)
                    pixmap = pixmap.scaled(64, 64, Qt.KeepAspectRatio, Qt.SmoothTransformation)
                    list_item.setIcon(QIcon(pixmap))

            if package == "JackIVs Recommended":
                icon_path = "bin/icons/jackiv.png"
                if os.path.exists(icon_path):
                    pixmap = QPixmap(icon_path)
                    pixmap = pixmap.scaled(64, 64, Qt.KeepAspectRatio, Qt.SmoothTransformation)
                    list_item.setIcon(QIcon(pixmap))

            if package == "SomeWaffles Recommended":
                icon_path = "bin/icons/somewaffle.png"
                if os.path.exists(icon_path):
                    pixmap = QPixmap(icon_path)
                    pixmap = pixmap.scaled(64, 64, Qt.KeepAspectRatio, Qt.SmoothTransformation)
                    list_item.setIcon(QIcon(pixmap))

            self.package_list.addItem(list_item)

        # Add advanced options if checkbox is checked
        if self.show_advanced:
            for package in self.advanced_options:
                list_item = QListWidgetItem(f"{current_distro} - {package}")
                list_item.setFont(font)  # Apply the larger font
                self.package_list.addItem(list_item)


    def run_install_script(self):
        """Runs the bash script with the selected distro and package type."""
        self.installbutton.setText("Installing...")
        self.installbutton.setDisabled(True)
        selected_distro = self.distro_combo.currentText().replace(" (Your Distribution/Recommended)", "")
        selected_package = self.package_list.currentItem().text().split(" - ")[1]  # Get the selected package

        # Print the selected distro and package for debug
        print(f"Running script for {selected_distro} with package {selected_package}")

        # Run the bash script with the selected distro and package as arguments
        try:
            subprocess.run(['bash', 'bin/install.sh', selected_distro, selected_package], check=True)
            print("Bash script executed successfully!")
        except subprocess.CalledProcessError as e:
            print(f"An error occurred while running the script: {e}")

    def closeapp(self):
        self.closeappbutton.setText('Closing')
        print("User clicked on closeappbutton")
        print("Closing the app now!")
        time.sleep(1)
        exit()

# Main code to run the app
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = LinuxApp()
    window.show()
    sys.exit(app.exec_())
