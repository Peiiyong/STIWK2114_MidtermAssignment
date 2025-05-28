# MIDTERM ASSIGNMENT : Worker Task Management System (WTMS) 
<table border="1">
  <tr>
    <td><strong>Name</strong></td>
    <td>TAN PEI YONG</td>
  </tr>
  <tr>
    <td><strong>Matric Number</strong></td>
    <td>291688</td>
  </tr>  
  <tr>
    <td><strong>Subject</strong></td>
    <td>STIWK2114 / Mobile Programming</td>
  </tr>  
  <tr>
    <td><strong>Semester</strong></td>
    <td>A242</td>
  </tr>  
  <tr>
    <td><strong>Assignment Title</strong></td>
    <td>Worker Task Management System (WTMS)</td>
  </tr>  
  <tr>
    <td><strong>Submission Date</strong></td>
    <td>30/5/2025</td>
  </tr>  
</table>

## 1.0 App Description

<div align="justify">
The Worker Task Management System (WTMS) is a Flutter-based mobile application that enables workers to register, log in, and manage their profiles. It enables workers to securely create an account, authenticate their identity, view personal details, and edit personal details. The app communicates with a backend developed in PHP and uses a MySQL database for data storage. WTMS ensures secure login through SHA1 password hashing and stores session data using SharedPreferences for persistence. The application is structured with clean screen transitions and follows good mobile UI/UX practices.
<br><br>
Initially, the app will display a splash screen and transition to the login screen for new users. Users can click the 'Register' field below to navigate to the registration screen and create an account, following these rules: the password must be more than 6 characters, the email must be valid, and the phone number must contain 10–11 digits.
<br><br>
After a successful login, the app displays an icon featuring the WTMS logo. By tapping this icon, users are directed to the task list screen where they can view their assigned tasks. To submit task completion, users can tap the upload icon and enter their completion text.
<br><br>
A side menu is available for quick navigation. It includes the following tiles:
  
- Home – displays the task list icon.

- Settings – opens the settings configuration

- Log Out – logs the user out
<br><br>
Within the Settings page, users will find:

- Profile – view and update personal information. Users can swipe a profile detail (such as email, address, or phone number) to the left to edit it.

- Dark Mode – switch between light and dark themes.

- Reset Password – update the account password.
</div>

## 2.0 Implementation
<div>
This section explains the implementation of the WTMS (Worker Task Management System) using Flutter for both the front-end and back-end. It includes custom widgets, user interface screens, classes, and data configuration. The app follows modular design principles to ensure reusability and maintainability.

<h3>2.1 Flutter Front-End</h3>
<h4> Splash Screen </h4>
<p>The Splash Screen is the initial screen that appears when the Worker Task Management System (WTMS) app launches. It provides a brief loading animation and checks if the worker is already logged in using SharedPreferences.</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <td><strong>Features</strong></td>
    <td><strong>Description</strong></td>
  </tr>
  <tr>
    <td><strong><i>Branding Display</i></strong></td>
    <td>Shows the app logo, name (WTMS), and a short description.</td>
  </tr>  
  <tr>
    <td><strong><i>Loading Animation</i></strong></td>
    <td>Uses SpinKitSpinningLines from flutter_spinkit to indicate the app is loading.</td>
  </tr>  
  <tr>
    <td><strong><i>7-Second Delay</i></strong></td>
    <td>Uses Future.delayed() to simulate loading and allow branding visibility before login check.</td>
  </tr>  
  <tr>
    <td><strong><i>Session Persistence Check</i></strong></td>
    <td><li>If SharedPreferences contains isLoggedIn = true, and valid worker JSON data, it navigates to the HomeScreen with parsed worker info.</li>
    <li>If not logged in, or if data is missing/corrupt, it navigates to the LoginScreen.</li></td>
  </tr>  
</table>

<h4>Login Screen</h4>
<p>
  The Login Screen is the primary interface for workers to securely access the Worker Task Management System (WTMS). 
  It includes input fields for credentials, UI customization for user experience, and login session persistence with SharedPreferences.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Stylized Branding</i></strong></td>
    <td>Shows the app logo, name (WTMS), and reinforces app identity before login.</td>
  </tr>
  <tr>
    <td><strong><i>User Input Fields</i></strong></td>
    <td>
      <ul>
        <li>Email TextField: Accepts user email input with validation.</li>
        <li>Password TextField: Secure field with visibility toggle using _isObscure state.</li>
        <li>Form Validation: Ensures both fields are filled before login request.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Keep Me Signed In (Session Persistence)</i></strong></td>
    <td>
      <ul>
        <li>Checkbox allowing users to stay logged in between sessions.</li>
        <li>If checked, SharedPreferences saves the login state (isLoggedIn = true) and worker data in JSON format.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Password Visibility Toggle</i></strong></td>
    <td>A clickable suffix icon to show/hide the password field content.</td>
  </tr>
  <tr>
    <td><strong><i>Navigation Options</i></strong></td>
    <td>
      <ul>
        <li><i>Forgot Password</i> link navigates to <code>ForgotPassScreen</code>.</li>
        <li><i>Create an Account</i> link navigates to <code>RegistrationScreen</code>.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Login Action</i></strong></td>
    <td>
      <ul>
        <li>Validates inputs.</li>
        <li>Sends a POST request to the server (<code>login_worker.php</code>) using HTTP.</li>
        <li>If login is successful and <code>status == success</code>, decodes worker JSON data, stores it if “Keep Me Signed In” is checked, and navigates to <code>HomeScreen</code>.</li>
        <li>If login fails, displays a red SnackBar with an error message.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Loading Indicator</i></strong></td>
    <td>Shows a <code>SpinKitFadingCube</code> dialog while waiting for server response.</td>
  </tr>
  <tr>
    <td><strong><i>Auto Session Check</i></strong></td>
    <td>
      <ul>
        <li>In <code>initState()</code>, <code>_checkSession()</code> checks SharedPreferences for saved login session.</li>
        <li>If <code>isLoggedIn == true</code> and valid worker data is found, it automatically navigates to <code>HomeScreen</code>.</li>
      </ul>
    </td>
  </tr>
</table>

<h4>Register Screen</h4>
<p>
  The Register Screen allows new workers to create an account by submitting their personal and work-related details. 
  This screen is essential for onboarding new users into the WTMS system.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Stylized Branding</i></strong></td>
    <td>Shows the app logo, name (WTMS), and reinforces app identity before login.</td>
  </tr>
  <tr>
    <td><strong><i>User Input Fields</i></strong></td>
    <td>
      <ul>
        <li><strong>Full Name:</strong> TextField with <code>Icons.person</code> as prefix.</li>
        <li><strong>Email:</strong> TextField with email validation and <code>Icons.email</code>.</li>
        <li><strong>Password & Confirm Password:</strong> Obscured text input with visibility toggle using <code>_isObscurePass</code> and <code>_isObscureConfirmPass</code>.</li>
        <li><strong>Phone Number:</strong> Accepts only digits using <code>TextInputType.phone</code>.</li>
        <li><strong>Address:</strong> Multiline input (<code>maxLines: 3</code>, <code>maxLength: 40</code>) with home icon.</li>
        <li><strong>Register Button:</strong> Submits the form.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Password & Confirm Pass Visibility Toggle</i></strong></td>
    <td>A clickable suffix icon to show/hide the password field content.</td>
  </tr>
  <tr>
    <td><strong><i>Form Validation</i></strong></td>
    <td>
      <ul>
        <li>Ensures all fields are filled before submission.</li>
        <li>Validates email format using regex.</li>
        <li>Check that password meets minimum length requirements.</li>
        <li>Check that password and confirm password match.</li>
        <li>Check that phone number must contain 10–11 digits.</li>
        <li>Error messages displayed below fields for invalid input.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Registration Process</i></strong></td>
    <td>
      <ul>
        <li>On register button press, collects data and sends it via <code>http.post()</code> to the backend registration API.</li>
        <li>JSON response is parsed to check for success.</li>
        <li><strong>On successful registration:</strong> Displays a confirmation using <code>SnackBar</code> and navigates to the <code>LoginScreen</code>.</li>
        <li><strong>On failure:</strong> Displays an error message in a dialog (e.g., “Email already exists”).</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Error Handling</i></strong></td>
    <td>
      <ul>
        <li><strong>Server Error:</strong> Uses <code>AlertDialog</code> to show server error messages based on response.</li>
        <li><strong>Network Issues:</strong> Catch block shows appropriate message if the request fails.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Loading Indicator</i></strong></td>
    <td>Displays a spinner (e.g., <code>SpinKitThreeBounce</code>) during the API request to enhance responsiveness.</td>
  </tr>
</table>

<h4>Forgot Password Screen</h4>
<p>
  The Forgot Password Screen allows users to reset their password by entering their registered email address. It provides input validation and communicates with the backend to trigger password reset instructions.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>UI Structure</i></strong></td>
    <td>
      <ul>
        <li>Shows the title (Reset Password) and key icon.</li>
        <li><strong>Before validation:</strong><br>
          - Display Email TextField.<br>
          - Display Validate button.
        </li>
        <li><strong>After validation:</strong><br>
          - Display Password TextField and Confirm Password TextField.<br>
          - Display Reset button.
        </li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>User Input Fields</i></strong></td>
    <td>
      <ul>
        <li>Email: TextField with email validation and Icons.email.</li>
        <li>Password & Confirm Password: Obscured text input with visibility toggle using _isObscurePass and _isObscureConfirmPass. (visible only after email is validated)</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Password & Confirm Pass Visibility Toggle</i></strong></td>
    <td>A clickable suffix icon to show/hide the password field content.</td>
  </tr>
  <tr>
    <td><strong><i>Validation and Process</i></strong></td>
    <td>
      <ul>
        <li>Sends a POST request to the server (forgot_password.php) to check if the email exists.</li>
        <li>If email exists: show Password TextField, Confirm Password TextField, and Reset button.</li>
        <li>If the email is not found, show an error message.</li>
        <li>Ensures all fields are filled before submission.</li>
        <li>Check that password meets minimum length requirements.</li>
        <li>Check that the password matches the confirmed password.</li>
        <li>If the password meets the criteria, send a POST request to (reset_password.php) with email and new password.</li>
        <li>If reset is successful and status == success:<br>
          - Displays a green SnackBar with “Password successfully reset”.<br>
          - Navigates to the Login Screen.
        </li>
        <li>Else:<br>
          - Displays a red SnackBar with “Failed to reset password”.
        </li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Loading Indicator</i></strong></td>
    <td>Shows a SpinKitFadingCube dialog while waiting for server response.</td>
  </tr>
</table>

<h4>MyButton Widget</h4>
<p>
  The MyButton widget is a reusable button component designed for key authentication screens like Login, Register, and Forgot Password. It combines text and an icon for a visually engaging call-to-action and is styled for consistency across the app.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Custom Widget</i></strong></td>
    <td>MyButton is a StatelessWidget that encapsulates both UI and logic for a tappable button.</td>
  </tr>
  <tr>
    <td><strong><i>Parameters</i></strong></td>
    <td>
      <ul>
        <li>text (String): The label displayed on the button.</li>
        <li>onTap (Function?): Callback triggered when button is tapped.</li>
        <li>icon (Icon): An icon to accompany the label.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Stylized Container</i></strong></td>
    <td>Decorated with sprimaryColor, rounded corners (radius 20), and uniform padding for aesthetic consistency.</td>
  </tr>
  <tr>
    <td><strong><i>Horizontal Layout</i></strong></td>
    <td>Uses a Row to align text and icon with spacing for readability and visual appeal.</td>
  </tr>
  <tr>
    <td><strong><i>Font and Style</i></strong></td>
    <td>Serif font, bold white text, and spacing (letterSpacing: 7) for a strong, professional appearance.</td>
  </tr>
  <tr>
    <td><strong><i>Reusability</i></strong></td>
    <td>Designed to be plugged into various screens for consistent behavior and design throughout the app.</td>
  </tr>
</table>

<h4>Home Screen</h4>
<p>
  The Home Screen acts as the main landing page of the Worker Task Management System (WTMS) after a successful login. It provides quick access to the worker’s task list through a central interactive icon while maintaining a clean layout and consistent design aesthetics.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Task Navigation</i></strong></td>
    <td>
      Displays a central WTMS logo icon. When tapped, it navigates the user to the <code>TaskListScreen</code> using <code>Navigator.push()</code>, passing the logged-in worker's information.
    </td>
  </tr>
  <tr>
    <td><strong><i>Custom Branding</i></strong></td>
    <td>
      Features a stylized app title <code>W T M S</code> in the AppBar using a serif font, bold weight, and letter spacing to enhance branding and visual hierarchy.
    </td>
  </tr>
  <tr>
    <td><strong><i>Centralized Layout</i></strong></td>
    <td>
      Utilizes <code>Container</code> with padding and rounded corners to emphasize the clickable logo icon. Includes custom sizing and spacing for a clean and balanced appearance.
    </td>
  </tr>
  <tr>
    <td><strong><i>Image Integration</i></strong></td>
    <td>
      Loads an asset image <code>logo.png</code> as the primary interface element, styled with theming colors for contrast and visual appeal.
    </td>
  </tr>
  <tr>
    <td><strong><i>Navigation Drawer</i></strong></td>
    <td>
      Includes a side drawer via the <code>MyDrawer</code> component, allowing users to access settings, log out, and navigate other parts of the app.
    </td>
  </tr>
  <tr>
    <td><strong><i>Theming and Styling</i></strong></td>
    <td>
      Adopts theme-based color management through <code>Theme.of(context).colorScheme</code>, ensuring dark/light mode compatibility and consistent branding.
    </td>
  </tr>
</table>

  <h4>Task List Screen</h4>
  <p>  The Task List Screen shows all tasks assigned to the logged-in worker. It fetches task data from the server and displays each task with details like title, ID, description, assigned and due dates, and status. The design follows consistent app theming and allows navigation to submit task completion.</p>

  <p><strong>Key Features:</strong></p>
  <table border="1" cellpadding="6" cellspacing="0" style="border-collapse: collapse;">
    <tr>
      <th>Feature</th>
      <th>Description</th>
    </tr>
    <tr>
      <td><strong>Task Display</strong></td>
      <td>Lists tasks in cards showing task title, ID, description, assigned date, due date, and status.</td>
    </tr>
    <tr>
      <td><strong>Data Fetching</strong></td>
      <td>Retrieves tasks via a POST request to <code>get_works.php</code> using the worker's ID and updates UI.</td>
    </tr>
    <tr>
      <td><strong>Task Card Layout</strong></td>
      <td>Cards include icons for tasks, calendar, status, and a button to submit task completion.</td>
    </tr>
    <tr>
      <td><strong>Navigation</strong></td>
      <td>Upload icon navigates to <code>SubmitCompletionScreen</code> to submit proof of task completion.</td>
    </tr>
    <tr>
      <td><strong>Theming &amp; Styling</strong></td>
      <td>Uses <code>Theme.of(context).colorScheme</code> for colors, fonts, and consistent app branding.</td>
    </tr>
    <tr>
      <td><strong>State Management</strong></td>
      <td>Stateful widget updates the UI dynamically when tasks are fetched or changed.</td>
    </tr>
  </table>

  <h4>Submit Completion Screen</h4>
  <p>This screen allows users to submit details about the completion of a task assigned to them.</p>

<p><strong>Key Features:</strong></p>
<table border="1" cellpadding="6" cellspacing="0" style="border-collapse: collapse;">
  <tr>
    <th>Feature</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Task Info Display</strong></td>
    <td>Shows the task ID in the app bar and the task title with an icon on the screen.</td>
  </tr>
  <tr>
    <td><strong>Completion Input</strong></td>
    <td>Multiline text field with character limit for users to enter details of what they completed.</td>
  </tr>
  <tr>
    <td><strong>Submit Button</strong></td>
    <td>Button triggers a confirmation dialog before submitting the completion details to the server.</td>
  </tr>
  <tr>
    <td><strong>Input Validation</strong></td>
    <td>Ensures the completion input is not empty; shows error snackbar if validation fails.</td>
  </tr>
  <tr>
    <td><strong>Network Request</strong></td>
    <td>Sends a POST request with task ID, worker ID, and submission text to the server endpoint.</td>
  </tr>
  <tr>
    <td><strong>User Feedback</strong></td>
    <td>Displays success or error messages using SnackBar depending on the response or network error.</td>
  </tr>
</table>

<h4>MyButton2 Widget</h4>
<p>
  The MyButton2 widget is a reusable button component. It combines text and an icon for a visually engaging call-to-action and is styled for consistency across the app.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Custom Widget</i></strong></td>
    <td>MyButton2 is a StatelessWidget that encapsulates both UI and logic for a tappable button.</td>
  </tr>
  <tr>
    <td><strong><i>Parameters</i></strong></td>
    <td>
      <ul>
        <li>text (String): The label displayed on the button.</li>
        <li>onTap (Function?): Callback triggered when button is tapped.</li>
        <li>icon (Icon): An icon to accompany the label.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Stylized Container</i></strong></td>
    <td>Decorated with theme, rounded corners (radius 20), and uniform padding for aesthetic consistency.</td>
  </tr>
  <tr>
    <td><strong><i>Horizontal Layout</i></strong></td>
    <td>Uses a Row to align text and icon with spacing for readability and visual appeal.</td>
  </tr>
  <tr>
    <td><strong><i>Font and Style</i></strong></td>
    <td>Serif font, bold white text, and spacing (letterSpacing: 7) for a strong, professional appearance.</td>
  </tr>
  <tr>
    <td><strong><i>Reusability</i></strong></td>
    <td>Designed to be plugged into various screens for consistent behavior and design throughout the app.</td>
  </tr>
</table>



<h4>MyDrawerTile Widget</h4>
<p>
  The MyDrawerTile widget is a reusable navigation tile designed for use within a Drawer. It visually combines a label and icon, and executes a specific action when tapped.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Custom Widget</i></strong></td>
    <td>MyDrawerTile is a StatelessWidget that encapsulates both the icon and text for drawer menu items, making the drawer more modular and clean.</td>
  </tr>
  <tr>
    <td><strong><i>Parameters</i></strong></td>
    <td>
      <ul>
        <li>text (String): Label for the drawer item.</li>
        <li>icon (IconData): Visual icon for the menu item.</li>
        <li>onTap (Function?): Tap callback.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Theming Support</i></strong></td>
    <td>Colors of the icon and text are styled using Theme.of(context).colorScheme.inversePrimary, ensuring theme consistency across light/dark modes.</td>
  </tr>
  <tr>
    <td><strong><i>Text Label</i></strong></td>
    <td>Displays the drawer option label using Theme.of(context).colorScheme.inversePrimary.</td>
  </tr>
  <tr>
    <td><strong><i>Icon Display</i></strong></td>
    <td>Shows the specified icon on the left, styled consistently with the label.</td>
  </tr>
  <tr>
    <td><strong><i>Tap Handler</i></strong></td>
    <td>Executes the provided onTap callback when the tile is tapped, enabling dynamic navigation.</td>
  </tr>
  <tr>
    <td><strong><i>Padding</i></strong></td>
    <td>Adds left padding (left: 25.0) to visually align the tile in the drawer for a clean layout.</td>
  </tr>
</table>

<h4>MyDrawer Widget</h4>
<p>
  The MyDrawer widget is a reusable navigation sidebar component used throughout the app. It provides quick access to key features such as Profile, Settings, and Logout, and helps maintain a consistent user experience.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Custom Navigation UI</i></strong></td>
    <td>MyDrawer is a StatelessWidget that structures the app’s side drawer using a vertical Column layout.</td>
  </tr>
  <tr>
    <td><strong><i>Parameters</i></strong></td>
    <td>
      <ul>
        <li>worker (Worker): Passes the current user’s data to other screens like SettingsScreen.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Drawer Items</i></strong></td>
    <td>Uses MyDrawerTile components to display tappable list items for Profile, Settings, and Logout.</td>
  </tr>
  <tr>
    <td><strong><i>Logout Handling</i></strong></td>
    <td>Clears stored user data using SharedPreferences and navigates back to the LoginScreen safely using pushAndRemoveUntil().</td>
  </tr>
  <tr>
    <td><strong><i>Theming & Icons</i></strong></td>
    <td>Icons and colors adapt to the app’s current ThemeData, providing a responsive and modern look in both light and dark modes.</td>
  </tr>
  <tr>
    <td><strong><i>Flexible Layout</i></strong></td>
    <td>Utilizes Spacer() to align the logout tile to the bottom of the drawer, ensuring a clean and user-friendly layout.</td>
  </tr>
</table>

<h4>Settings Screen</h4>
<p>
  The SettingsScreen is a configuration interface that allows users to adjust their application preferences, such as enabling dark mode and resetting their password. It ensures a user-specific experience by accepting the Worker object to personalize settings like password reset.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Custom Screen</i></strong></td>
    <td>SettingsScreen is a StatefulWidget that presents interactive settings using reusable MySettingsTile widgets for modular and clean UI.</td>
  </tr>
  <tr>
    <td><strong><i>Worker Parameters</i></strong></td>
    <td>Accepts a Worker object to pass along user-specific data to child screens like ResetPassScreen.</td>
  </tr>
  <tr>
    <td><strong><i>Dark Mode Toggle</i></strong></td>
    <td>Implements a switch tile (MySettingsTile) allowing users to enable or disable dark mode. Uses Provider to manage theme changes globally.</td>
  </tr>
  <tr>
    <td><strong><i>Reset Password</i></strong></td>
    <td>Provides a toggleable option to navigate to ResetPassScreen (even though a switch is visually used, it functions as a tap-triggered navigation).</td>
  </tr>
  <tr>
    <td><strong><i>Navigation & Routing</i></strong></td>
    <td>Clicking the reset password tile triggers Navigator.push to go to the ResetPassScreen, passing the current Worker object.</td>
  </tr>
  <tr>
    <td><strong><i>Reusable Tile Widget</i></strong></td>
    <td>Leverages the custom MySettingsTile widget for consistent UI design and layout of setting options.</td>
  </tr>
  <tr>
    <td><strong><i>Theming and Styling</i></strong></td>
    <td>Follows Theme.of(context).colorScheme for consistent look and feel across icons, text, backgrounds, and switches.</td>
  </tr>
</table>

<h4>MySettingsTile Widget</h4>
<p>
  The MySettingsTile widget is a reusable component used in the settings screen of the app. It displays individual setting options with icons, titles, and optional switches, making it easy to toggle and interact with different settings.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Custom Widget</i></strong></td>
    <td>MySettingsTile is a StatelessWidget that structures a tile with an icon, title, and optional switch within a Row layout.</td>
  </tr>
  <tr>
    <td><strong><i>Parameters</i></strong></td>
    <td>
      <ul>
        <li><strong>icon</strong>: Displays an icon for the setting.</li>
        <li><strong>title</strong>: Specifies the title of the setting.</li>
        <li><strong>hasSwitch</strong>: A flag to indicate whether a switch should be included (defaults to false).</li>
        <li><strong>switchValue</strong>: The current value of the switch (defaults to false).</li>
        <li><strong>onToggle</strong>: Optional callback for the switch’s toggle event.</li>
        <li><strong>onTap</strong>: Optional callback for handling tap events on the tile.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Switch Handling</i></strong></td>
    <td>If the hasSwitch parameter is set to true, a CupertinoSwitch is displayed to allow toggling of the setting’s state. The switch is controlled by the switchValue property and can trigger the onToggle callback.</td>
  </tr>
  <tr>
    <td><strong><i>Icon & Title</i></strong></td>
    <td>The widget includes an icon and title to represent the setting visually. The icon’s color and size adapt based on the app’s theme, providing a consistent user experience in both light and dark modes.</td>
  </tr>
  <tr>
    <td><strong><i>Theming & Icons</i></strong></td>
    <td>Icons and colors adapt dynamically to the app’s ThemeData, ensuring that the widget looks great in both light and dark themes. The inversePrimary color from the theme is used for icon and text colors.</td>
  </tr>
  <tr>
    <td><strong><i>Interactive Layout</i></strong></td>
    <td>The widget is interactive, with the option to trigger actions using the onTap callback, making it versatile for navigation or other actions when the tile is tapped.</td>
  </tr>
  <tr>
    <td><strong><i>Flexible Layout</i></strong></td>
    <td>The widget utilizes Container and Row to structure the elements in a flexible and responsive way. The margin, padding, and border radius ensure a clean and modern design, while CupertinoSwitch is conditionally displayed if required.</td>
  </tr>
</table>
<h4>Profile Screen</h4>
<p>
   The Profile Screen is where logged-in workers can view and manage their personal information in the Worker Task Management System (WTMS). It presents detailed user information and supports real-time editing while maintaining a consistent UI and seamless session management.
</p>
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Profile Overview</i></strong></td>
    <td>Displays the worker’s full profile (name, ID, email, phone, address) using the custom MyProfile widget and data from the worker object.</td>
  </tr>
  <tr>
    <td><strong><i>Edit Capability</i></strong></td>
    <td>Allows users to edit specific profile fields (Email, Phone, Address) by swiping a tile to the left, triggering an interactive dialog box.</td>
  </tr>
  <tr>
    <td><strong><i>Form Validation</i></strong></td>
    <td>
      <ul>
        <li>Ensures updated email format is valid and not exists in the database before saving changes.</li>
        <li>Ensures updated phone numbers meet length criteria before saving changes.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Edit Process</i></strong></td>
    <td>
      <ul>
        <li>Sends a POST request to update_worker.php on the server to sync changes with the database.</li>
        <li>Updates worker data in SharedPreferences to reflect changes locally for session continuity.</li>
        <li>Displays a SnackBar message indicating success or failure after attempting an update.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Theming and Styling</i></strong></td>
    <td>Adopts app-wide theming using Theme.of(context).color Scheme for consistent branding across background, title bar, and icon colors.</td>
  </tr>
</table>

<h4>MyProfileTile Widget</h4>
<p>
  The MyProfileTile widget is a custom, reusable UI component used within the Home Screen to display individual worker profile fields in a clean, interactive format. It incorporates flutter_slidable to offer an intuitive swipe-to-edit experience.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Custom Widget</i></strong></td>
    <td>MyProfileTile is a StatelessWidget that encapsulates UI and interaction logic for displaying a profile field (e.g., Email, Phone, Address).</td>
  </tr>
  <tr>
    <td><strong><i>Parameters</i></strong></td>
    <td>
      <ul>
        <li>title (String): Label for the field.</li>
        <li>text (String): The actual worker data.</li>
        <li>icon (Icon): Visual indicator for the field.</li>
        <li>editDetails (Function): Callback for editing the field.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Slidable Integration</i></strong></td>
    <td>Uses flutter_slidable package to provide swipeable editing action. Users can swipe left to reveal an edit icon.</td>
  </tr>
  <tr>
    <td><strong><i>Stylized Container</i></strong></td>
    <td>The main UI is wrapped in a decorated Container with padding, border radius, shadow, and theming to ensure consistent design.</td>
  </tr>
  <tr>
    <td><strong><i>Interactive UI</i></strong></td>
    <td>When the user taps the edit icon in the SlidableAction, the editDetails() callback is triggered with the field title passed in.</td>
  </tr>
  <tr>
    <td><strong><i>Theming & Font</i></strong></td>
    <td>Colors and fonts are dynamically derived from Theme.of(context).colorScheme and use a custom serif font for professionalism.</td>
  </tr>
</table>

<h4>MyProfile Widget</h4>
<p>
  The MyProfile widget displays a worker’s full profile in a structured and styled format. It includes personal information like full name, ID, email, phone number, and address, and integrates editing functionality for each field using the MyProfileTile widget.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Custom Widget</i></strong></td>
    <td>MyProfile is a StatelessWidget that displays the worker’s name, ID, and other personal details.</td>
  </tr>
  <tr>
    <td><strong><i>Parameters</i></strong></td>
    <td>
      <ul>
        <li>worker (Worker): Contains profile information (name, ID, email, phone, address).</li>
        <li>editDetails (Function): Callback triggered on edit swipe.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Profile Header</i></strong></td>
    <td>A decorated Container with curved bottom corners, showing a CircleAvatar icon, name in uppercase, and worker ID.</td>
  </tr>
  <tr>
    <td><strong><i>Modular Detail Tiles</i></strong></td>
    <td>Reuses the MyProfileTile widget for Email, Phone, and Address with consistent styling and swipe-to-edit support (via flutter_slidable).</td>
  </tr>
  <tr>
    <td><strong><i>Edit Functionality</i></strong></td>
    <td>The editDetails function is passed to each MyProfileTile, enabling in-place editing when the slidable edit icon is used.</td>
  </tr>
  <tr>
    <td><strong><i>Theming & Fonts</i></strong></td>
    <td>Uses dynamic color styling from Theme.of(context).color Scheme and custom serif fonts for a professional look.</td>
  </tr>
</table>
<h4>Reset Password Screen</h4>
<p>
  The Reset Password Screen allows users to reset their password. It provides input validation and communicates with the backend to trigger password reset instructions.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>UI Structure</i></strong></td>
    <td>
      <li>The screen shows a key icon and a title, “Reset Password.”</li> 
      <li>It initially displays two TextField widgets for the user to enter the new password and confirm the new password. These fields are hidden and toggled with the visibility icon.</li> 
      <li>A “RESET” button triggers the password reset process after validation.</li>
    </td>
  </tr>
  <tr>
    <td><strong><i>Parameters</i></strong></td>
    <td>
      <ul>
        <li><strong>worker</strong> (Worker): Contains profile information (name, ID, email, phone, address).</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td><strong><i>Password & Confirm Pass Visibility Toggle</i></strong></td>
    <td>A clickable suffix icon to show/hide the password field content.</td>
  </tr>
  <tr>
    <td><strong><i>Password Validation</i></strong></td>
    <td>
      <li>Ensures all fields are filled before submission.</li> <li>Check that password meets minimum length requirements.</li> <li>Check that the password matches the confirmed password.</li>
    </td>
  </tr>
  <tr>
    <td><strong><i>Reset Password Process</i></strong></td>
    <td>
      <li>If the password meets the criteria, send a POST request to (reset_password.php) with email and new password.</li> 
      <li>If reset is successful and status == success: Displays a green SnackBar with “Password successfully reset” and navigates to the Login Screen. </li>
        <li>Else: Displays a red SnackBar with “Failed to reset password”.</li>
    </td>
  </tr>
  <tr>
    <td><strong><i>Loading Indicator</i></strong></td>
    <td>Shows a SpinKitFadingCube dialog while waiting for server response.</td>
  </tr>
</table>

<h4>ThemeProvider Class</h4>
<p>
  The ThemeProvider class was implemented to manage the theme of the app (light mode and dark mode). It provides functionality to toggle between the two themes and persist the user's theme preference across app sessions using SharedPreferences.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Theme Management</i></strong></td>
    <td>Manages light and dark modes. Defaults to light mode and can toggle between themes.</td>
  </tr>
  <tr>
    <td><strong><i>Persistent Storage</i></strong></td>
    <td>Saves the selected theme to SharedPreferences to persist the user's choice across app restarts.</td>
  </tr>
  <tr>
    <td><strong><i>Dynamic Theme Update</i></strong></td>
    <td>Notifies listeners when the theme changes, triggering a UI update to reflect the new theme.</td>
  </tr>
  <tr>
    <td><strong><i>Separation of Concerns</i></strong></td>
    <td>Light and dark modes are defined separately in light_mode.dart and dark_mode.dart for modularity.</td>
  </tr>
  <tr>
    <td><strong><i>_themeData</i></strong></td>
    <td>Holds the current theme (either lightMode or darkMode).</td>
  </tr>
  <tr>
    <td><strong><i>themeData Getter</i></strong></td>
    <td>Provides access to the current theme used by the app.</td>
  </tr>
  <tr>
    <td><strong><i>isDarkMode Getter</i></strong></td>
    <td>Returns a boolean indicating if the current theme is dark mode.</td>
  </tr>
  <tr>
    <td><strong><i>toggleTheme Method</i></strong></td>
    <td>Switches between light and dark mode, updates SharedPreferences, and notifies listeners to rebuild UI.</td>
  </tr>
  <tr>
    <td><strong><i>_saveTheme Method</i></strong></td>
    <td>Saves the current theme preference (light or dark mode) to SharedPreferences.</td>
  </tr>
  <tr>
    <td><strong><i>_loadTheme Method</i></strong></td>
    <td>Loads the saved theme from SharedPreferences when the app starts. Defaults to light mode if no preference.</td>
  </tr>
  <tr>
    <td><strong><i>Integration</i></strong></td>
    <td>The ThemeProvider is integrated into the app via ChangeNotifierProvider, and the theme is applied globally.</td>
  </tr>
  <tr>
    <td><strong><i>Usage of Consumer Widget</i></strong></td>
    <td>Consumer widget listens for changes in the theme and applies the current theme across the app.</td>
  </tr>
</table>

<h4>Worker Class</h4>
<p>
  The Worker class is a model class used to represent worker-related data in a structured way.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Constructor (Worker)</i></strong></td>
    <td>Initializes a Worker object using the provided parameters: id, fullName, email, phone, and address.</td>
  </tr>
  <tr>
    <td><strong><i>fromJson Factory Method</i></strong></td>
    <td>
    <li>  Purpose: Converts JSON data (e.g., from a database or API response) into a Worker object.</li>
<li>Implementation: Uses named parameters to extract values from the JSON and initialize the Worker object.</li>
<li>Fallbacks: If any field in the JSON is null, it defaults to an empty string ('') using the null-coalescing operator (??).</li></td>
  </tr>
  <tr>
    <td><strong><i>toJson Method</i></strong></td>
    <td><li>Purpose: Converts a Worker object back into a JSON map for storage or communication with an API or database.</li>
<li>Implementation: Creates and returns a map with the worker's properties (id, full_name, email, phone, address), which can then be easily serialized into JSON.</li>
</td>
  </tr>
</table>
<h3>Task Class</h3>
<p>The Task class is a model class used to represent task-related data in a structured way.</p>

<h4>Key Features:</h4>
<table border="1" cellpadding="8" cellspacing="0">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Constructor (<code>Task</code>)</strong></td>
    <td>
      Initializes a <code>Task</code> object using the provided parameters:
      <code>id</code>, <code>title</code>, <code>description</code>,
      <code>assignedTo</code>, <code>dateAssigned</code>, <code>dueDate</code>, and <code>status</code>.
    </td>
  </tr>
  <tr>
    <td><strong>fromJson Factory Method</strong></td>
    <td>
      <strong>Purpose:</strong> Converts JSON data (e.g., from a database or API response) into a <code>Task</code> object.<br>
      <strong>Implementation:</strong> Uses named parameters to extract values from the JSON and initialize the <code>Task</code> object.
    </td>
  </tr>
  <tr>
    <td><strong>toJson Method</strong></td>
    <td>
      <strong>Purpose:</strong> Converts a <code>Task</code> object back into a JSON map for storage or communication with an API or database.<br>
      <strong>Implementation:</strong> Creates and returns a map with the task's properties:
      <code>id</code>, <code>title</code>, <code>description</code>, <code>assigned_to</code>,
      <code>date_assigned</code>, <code>due_date</code>, <code>status</code>.
    </td>
  </tr>
</table>

<h4>Config Class</h4>
<p>
  The Config class contains configuration settings for the application. It is used to define constants such as the server URL.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong><i>Class Purpose</i></strong></td>
    <td>Holds configuration settings and constants used across the app.</td>
  </tr>
  <tr>
    <td><strong><i>Static Variable</i></strong></td>
    <td><strong>server</strong>: Defines the base URL (http://127.0.0.1/wtms) for backend access.</td>
  </tr>
  <tr>
    <td><strong><i>Usage</i></strong></td>
    <td>Can be accessed globally via Config.server, avoiding hardcoding throughout.</td>
  </tr>
</table>


<h3>2.2 Flutter Back-End</h3>
<h4>dbconnect.php</h4>
<p>
  This PHP script establishes a connection between the application and the MySQL database (wtms_db). It is a crucial backend component that enables data retrieval and manipulation from the database through PHP-based APIs.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Connection Management</strong></td>
    <td>Centralizes database connectivity to be reused across multiple PHP scripts (e.g., for login, registration, worker retrieval).</td>
  </tr>
  <tr>
    <td><strong>Error Handling</strong></td>
    <td>Ensures the application notifies developers immediately if the database connection fails.</td>
  </tr>
</table>

<h4>register_worker.php</h4>
<p>
  This PHP script handles the backend logic for registering a new worker into the wtms_db database. It performs input collection, validation (duplicate checking), hashing, and database insertion, returning a JSON response to the front end.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Input Collection</strong></td>
    <td>Captures full_name, email, password, phone, and address from POST request.</td>
  </tr>
  <tr>
    <td><strong>Duplicate Checking</strong></td>
    <td>Validates uniqueness of full_name and email before registration.</td>
  </tr>
  <tr>
    <td><strong>Password Security</strong></td>
    <td>Applies SHA1 hashing to passwords before storing them in the database. (Basic; should be improved in production)</td>
  </tr>
  <tr>
    <td><strong>Data Insertion</strong></td>
    <td>Inserts valid new worker data into the workers table using SQL queries.</td>
  </tr>
  <tr>
    <td><strong>JSON Response</strong></td>
    <td>Returns structured responses (success or failed) using sendJsonResponse() function.</td>
  </tr>
  <tr>
    <td><strong>Error Handling</strong></td>
    <td>Handles database failures and duplicate entry cases gracefully with user-friendly messages.</td>
  </tr>
  <tr>
    <td><strong>Reusability</strong></td>
    <td>Uses db.php for centralized database connection management.</td>
  </tr>
</table>

<h4>login_worker.php</h4>
<p>
  This PHP script handles the user login process by verifying credentials against the database using secure methods. It uses a prepared SQL statement to prevent SQL injection and returns a JSON response to the client.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>HTTP Method Validation</strong></td>
    <td>Ensures only POST requests are processed for login logic.</td>
  </tr>
  <tr>
    <td><strong>Input Handling</strong></td>
    <td>Retrieves and sanitizes email and password fields from the request.</td>
  </tr>
  <tr>
    <td><strong>Password Security</strong></td>
    <td>Applies SHA1 hashing to the input password before comparing with the database.</td>
  </tr>
  <tr>
    <td><strong>SQL Injection Prevention</strong></td>
    <td>Uses prepared statements with parameter binding to enhance security.</td>
  </tr>
  <tr>
    <td><strong>Data Retrieval</strong></td>
    <td>Fetches worker data from the workers table if login credentials match.</td>
  </tr>
  <tr>
    <td><strong>JSON Response</strong></td>
    <td>Sends a structured success/failure message back to the client.</td>
  </tr>
  <tr>
    <td><strong>Error Reporting</strong></td>
    <td>Enables full error reporting during development for debugging purposes.</td>
  </tr>
</table>

<h4>forgot_password.php</h4>
<p>
  This PHP script checks whether an email address already exists in the database. It is typically used in the registration or password reset process to validate user existence before proceeding.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Email Validation</strong></td>
    <td>Checks if the email field is provided via POST request.</td>
  </tr>
  <tr>
    <td><strong>Database Query</strong></td>
    <td>Queries the workers table to see if the provided email exists.</td>
  </tr>
  <tr>
    <td><strong>Response Handling</strong></td>
    <td>Returns a JSON response indicating success (email exists) or failure.</td>
  </tr>
  <tr>
    <td><strong>Lightweight Design</strong></td>
    <td>Simple and efficient for fast client-side validation (e.g., real-time checks).</td>
  </tr>
  <tr>
    <td><strong>Error Feedback</strong></td>
    <td>Send clear feedback if the email parameter is missing.</td>
  </tr>
</table>

<h4>reset_password.php</h4>
<p>
  This PHP script handles the password reset functionality. It allows users to update their password securely by providing their registered email and new password.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Password Reset Logic</strong></td>
    <td>Updates the password field for the user with the matching email.</td>
  </tr>
  <tr>
    <td><strong>Password Security</strong></td>
    <td>Hashes the new password using SHA1 before storing it for basic security.</td>
  </tr>
  <tr>
    <td><strong>Prepared Statements</strong></td>
    <td>Uses prepared statements to protect against SQL injection.</td>
  </tr>
  <tr>
    <td><strong>Validation Checks</strong></td>
    <td>Verifies that both email and password fields are provided before execution.</td>
  </tr>
  <tr>
    <td><strong>JSON Response</strong></td>
    <td>Returns a structured response indicating success, failure, or input error.</td>
  </tr>
</table>

<h4>update_worker.php</h4>
<p>
  This PHP script allows the application to update specific profile fields (email, phone, or address) of a worker by validating and applying changes securely.
</p>

<p><strong>Key Features:</strong></p>

<table border="1">
  <tr>
    <th>Features</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Field Update Support</strong></td>
    <td>Supports selective updates for email, phone, or address fields.</td>
  </tr>
  <tr>
    <td><strong>Validation & Security</strong></td>
    <td>Validates field names and prevents updates to unauthorized columns.</td>
  </tr>
  <tr>
    <td><strong>Email Uniqueness Check</strong></td>
    <td>Prevents duplicate emails by checking if the new email already exists for another worker.</td>
  </tr>
  <tr>
    <td><strong>Prepared Statements</strong></td>
    <td>Uses prepared SQL statements to avoid SQL injection vulnerabilities.</td>
  </tr>
  <tr>
    <td><strong>Retry Mechanism</strong></td>
    <td>Retries the update operation up to 3 times if a database lock timeout occurs.</td>
  </tr>
  <tr>
    <td><strong>Debugging Logs</strong></td>
    <td>Logs POST input and errors for easier debugging and server-side monitoring.</td>
  </tr>
  <tr>
    <td><strong>JSON Response Output</strong></td>
    <td>Sends back clear JSON responses to inform the client of success, failure, or error details.</td>
  </tr>
</table>

<h4>get_works.php</h4>
<p>
  This PHP script retrieves all tasks assigned to a specific worker based on their worker_id. 
  It is used in the Worker Task Management System (WTMS) to fetch task details for display or processing.
</p>

<p><strong>Key Features:</strong></p>

<table border="1" cellpadding="6" cellspacing="0" style="border-collapse: collapse;">
  <tr>
    <th>Feature</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Input Validation</strong></td>
    <td>Checks if the <code>worker_id</code> is provided in the POST request to ensure valid input.</td>
  </tr>
  <tr>
    <td><strong>Secure Querying</strong></td>
    <td>Uses prepared statements with parameter binding to prevent SQL injection attacks.</td>
  </tr>
  <tr>
    <td><strong>Task Retrieval</strong></td>
    <td>Fetches all tasks assigned to the given worker from the <code>tbl_works</code> table.</td>
  </tr>
  <tr>
    <td><strong>JSON Response</strong></td>
    <td>Returns the list of tasks in JSON format, suitable for API consumption or frontend processing.</td>
  </tr>
  <tr>
    <td><strong>Error Handling</strong></td>
    <td>Returns a JSON error message if <code>worker_id</code> is missing from the POST data.</td>
  </tr>
</table>

<h4>submit_work.php</h4>
<p>
  This PHP script allows a worker to submit their task completion details by inserting a record into the <code>tbl_submissions</code> table.
  It validates input fields and securely saves the submission information for a specific task and worker.
</p>

<p><strong>Key Features:</strong></p>

<table border="1" cellpadding="6" cellspacing="0" style="border-collapse: collapse;">
  <tr>
    <th>Feature</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>Input Validation</strong></td>
    <td>Checks if <code>work_id</code>, <code>worker_id</code>, and <code>submission_text</code> are provided via POST to ensure all required data is present.</td>
  </tr>
  <tr>
    <td><strong>Secure Data Insertion</strong></td>
    <td>Uses prepared statements with bound parameters to safely insert submission data into the database, preventing SQL injection.</td>
  </tr>
  <tr>
    <td><strong>Database Interaction</strong></td>
    <td>Inserts a new record in the <code>tbl_submissions</code> table to log the worker’s submitted task report.</td>
  </tr>
  <tr>
    <td><strong>Response Handling</strong></td>
    <td>Returns a JSON response indicating success or failure of the insert operation, facilitating API integration and frontend feedback.</td>
  </tr>
  <tr>
    <td><strong>Error Feedback</strong></td>
    <td>Provides an error message if required POST parameters are missing, improving robustness and debugging.</td>
  </tr>
</table>


<h3>2.3 Database</h3>
<p>The database used for the Worker Task Management System (WTMS) is named wtms_db. It is designed to store and manage worker information securely and efficiently. The structure follows relational database design principles using MySQL.</p>
<p><strong>Database: wtms_db</strong></p>
<p><strong>Table: workers</strong></p>

<p>This table holds information about each registered worker in the system.</p>
<table border="1">
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>INT (AUTO_INCREMENT, PK)</td>
    <td>Worker ID</td>
  </tr>
  <tr>
    <td>full_name</td>
    <td>VARCHAR(100)</td>
    <td>Full name</td>
  </tr>
  <tr>
    <td>email</td>
    <td>VARCHAR(100)</td>
    <td>Unique email</td>
  </tr>
  <tr>
    <td>password</td>
    <td>VARCHAR(255)</td>
    <td>SHA1-hashed password</td>
  </tr>
  <tr>
    <td>phone</td>
    <td>VARCHAR(20)</td>
    <td>Phone number</td>
  </tr>
  <tr>
    <td>address</td>
    <td>TEXT</td>
    <td>Address</td>
  </tr>
</table>

<p>SQL command:</p>

          CREATE DATABASE wtms_db;

          USE wtms_db;

          CREATE TABLE workers (
             id INT AUTO_INCREMENT PRIMARY KEY,
             full_name VARCHAR(100) NOT NULL,
             email VARCHAR(100) NOT NULL UNIQUE,
             password VARCHAR(255) NOT NULL,
             phone VARCHAR(20) NOT NULL,
             address TEXT NOT NULL
         );

<p><strong>Table: tbl_works</strong></p>
<p>This table stores task details assigned to workers, including status and deadlines.</p>
<table border="1" cellpadding="6" cellspacing="0" style="border-collapse: collapse;">
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>INT (AUTO_INCREMENT, PK)</td>
    <td>Task ID</td>
  </tr>
  <tr>
    <td>title</td>
    <td>VARCHAR(100)</td>
    <td>Task title</td>
  </tr>
  <tr>
    <td>description</td>
    <td>TEXT</td>
    <td>Task description</td>
  </tr>
  <tr>
    <td>assigned_to</td>
    <td>INT</td>
    <td>ID of the assigned worker (FK to workers.id)</td>
  </tr>
  <tr>
    <td>date_assigned</td>
    <td>DATE</td>
    <td>Date the task was assigned</td>
  </tr>
  <tr>
    <td>due_date</td>
    <td>DATE</td>
    <td>Task deadline</td>
  </tr>
  <tr>
    <td>status</td>
    <td>VARCHAR(20)</td>
    <td>Task status, default is 'pending'</td>
  </tr>
</table>

<p>SQL command:</p>
<pre>
CREATE TABLE tbl_works (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  assigned_to INT NOT NULL,
  date_assigned DATE NOT NULL,
  due_date DATE NOT NULL,
  status VARCHAR(20) DEFAULT 'pending'
);

-- Sample Insert Data:
INSERT INTO tbl_works (title, description, assigned_to, date_assigned, due_date, status) VALUES
('Prepare Material A', 'Prepare raw material A for assembly.', 1, '2025-05-25', '2025-05-28', 'pending'),
('Inspect Machine X', 'Conduct inspection for machine X.', 2, '2025-05-25', '2025-05-29', 'pending'),
('Clean Area B', 'Deep clean work area B before audit.', 3, '2025-05-25', '2025-05-30', 'pending'),
('Test Circuit Board', 'Perform unit test for circuit batch 4.', 4, '2025-05-25', '2025-05-28', 'pending'),
('Document Process', 'Write SOP for packaging unit.', 5, '2025-05-25', '2025-05-29', 'pending'),
('Paint Booth Check', 'Routine check on painting booth.', 1, '2025-05-25', '2025-05-30', 'pending'),
('Label Inventory', 'Label all boxes in section C.', 2, '2025-05-25', '2025-05-28', 'pending'),
('Update Database', 'Update inventory in MySQL system.', 3, '2025-05-25', '2025-05-29', 'pending'),
('Maintain Equipment', 'Oil and tune cutting machine.', 4, '2025-05-25', '2025-05-30', 'pending'),
('Prepare Report', 'Prepare monthly performance report.', 5, '2025-05-25', '2025-05-30', 'pending');
</pre>

<p><strong>Table: tbl_submissions</strong></p>
<p>This table stores submissions made by workers as proof of task completion.</p>
<table border="1" cellpadding="6" cellspacing="0" style="border-collapse: collapse;">
  <tr>
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>INT (AUTO_INCREMENT, PK)</td>
    <td>Submission ID</td>
  </tr>
  <tr>
    <td>work_id</td>
    <td>INT</td>
    <td>Reference to the task (FK to tbl_works.id)</td>
  </tr>
  <tr>
    <td>worker_id</td>
    <td>INT</td>
    <td>Reference to the worker who submitted (FK to workers.id)</td>
  </tr>
  <tr>
    <td>submission_text</td>
    <td>TEXT</td>
    <td>Text or notes submitted as proof</td>
  </tr>
  <tr>
    <td>submitted_at</td>
    <td>DATETIME</td>
    <td>Timestamp of submission (defaults to current time)</td>
  </tr>
</table>

<p>SQL command:</p>
<pre>
CREATE TABLE tbl_submissions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  work_id INT NOT NULL,
  worker_id INT NOT NULL,
  submission_text TEXT NOT NULL,
  submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
</pre>

<p><strong>Key Features and Design Rationale</strong></p>
<ul>
  <li><strong>Primary Key:</strong> The id field uniquely identifies each record.</li>
  <li><strong>Security:</strong> Passwords are stored using SHA1 hashing to enhance data protection.</li>
  <li><strong>Validation:</strong> The email field is set to be unique, preventing duplicate registrations.</li>
  <li><strong>Scalability:</strong> The use of VARCHAR and TEXT allows flexibility for different lengths of input data.</li>
</ul>

<p><strong>Usage in App</strong></p>
<ul>
  <li>This table supports essential app functionalities such as:</li>
  <ul>
    <li>User registration and login</li>
    <li>Password recovery and reset</li>
    <li>Viewing and updating worker profiles</li>
    <li> Supports task management features including task assignment, deadline monitoring, and status updates.</li>
   <li> Supports submission and verification of task completion by workers.</li>
  </ul>
  <li>Data is exchanged between the app and the database using RESTful PHP APIs and parsed using JSON.</li>
</ul>

</div>

## 3.0 Screenshots
<table border="1" cellpadding="6" cellspacing="0" style="border-collapse: collapse; text-align: center;">
  <tr>
    <td>Splash screen</td>
    <td>Login Screen</td>
    <td>Register Screen</td>
    <td>Forgot Password</td>
  </tr>
    <tr>
    <td><img src="https://github.com/user-attachments/assets/50a7d67c-2825-4e65-ac09-484e679ae327" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/10a92c3f-72ae-4ee5-8c81-06b11b52c858" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/5b04f6e0-8294-4118-b8ce-c2289818e0e0" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/303444eb-d655-47c1-8c01-ca13fd1b2f7c" width="180" height="350"></td>
  </tr>
  <tr>
    <td>Forgot Password</td>
    <td>Home Screen</td>
    <td>Click Task</td>
    <td>Submit Screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/5529e3b7-894f-428c-9b75-bb8153ff368a" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/b52c674f-0eef-4fa8-a00a-2094cb863f74" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/49141989-5889-4a3f-af3f-98cf3a823a9d" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/9bf6d0fb-7f89-4440-ae48-ada649483527" width="180" height="350"></td>
  </tr>

 <tr>
    <td>Submitted</td>
    <td>Drawer</td>
    <td>Settings Screen</td>
    <td>Profile Screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/15d8bf01-d343-4e45-a9ea-e5f399c73cd0" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/e9b50ae0-f304-49d5-91de-039a4a72b6db" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/43efa6f3-0895-4309-b591-01c9464d502f" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/42648f63-3d36-4680-8f5d-d6c02dfea63e" width="180" height="350"></td>
  </tr>
  <tr>
    <td>Edit Details</td>
    <td>Dark Mode</td>
    <td>Reset Password</td>
    <td>Dark Mode in Home Screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/e68052bb-b205-492b-814b-9817876d8e8a" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/fef6a30f-fa76-4016-8bd5-97fda86426a8" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/a3ef2ce7-3e58-4ff8-8cec-9f8a703ad9d0" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/a8bb2429-fd94-47f4-9c7f-6e3786bd8966" width="180" height="350"></td>
  </tr>
</table>

## 4.0 Reflection / Challenges

<div align="justify">
In this assignment, I learned how to implement user authentication features, such as password reset functionality, using Flutter and server-side communication. I have gained experience in handling user input validation, such as ensuring passwords meet security criteria and match each other. I also learn how to make HTTP requests to interact with a backend server, process JSON responses, and display appropriate success or error messages to users. Additionally, I have improved my skills in creating user-friendly interfaces with features like loading spinners, text field visibility toggles, and dialog boxes for feedback. This assignment also teaches how to handle asynchronous operations effectively to maintain smooth app performance.
<br> <br>
One of the main challenges in this assignment is ensuring secure and efficient communication between the app and the server when resetting the password. Validating user input properly, including checking for minimum password length and matching passwords, is essential to avoid errors. Handling network requests efficiently, especially when dealing with slow or unreliable connections, can also be tricky. Moreover, providing real-time feedback through loading spinners and dialog boxes while maintaining a smooth user experience is crucial. Additionally, ensuring proper error handling for server responses and securing sensitive user data, like passwords, presents another challenge that needs careful consideration.
<br>  <br>
<b>Suggestions for Improvement:</b>
<ul>
  <li><strong>Responsive Design:</strong> Ensure the app works well on different screen sizes. Use MediaQuery or LayoutBuilder to make widgets responsive.</li>
  <li><strong>Improve Error Handling:</strong> Display user-friendly error messages for network issues or invalid inputs.</li>
  <li><strong>Secure API Communication:</strong>
    <ul>
      <li>Use HTTPS instead of HTTP for secure communication.</li>
      <li>Add token-based authentication (e.g., JWT) to secure API endpoints.</li>
    </ul>
  </li>
  <li><strong>Optimize API Calls:</strong> Minimize redundant API calls by caching data locally using SharedPreferences or Hive.</li>
</ul>
</div>

## 5.0 How to Run the App

<p><strong>5.1 BackEnd Setup:</strong></p>
<ul>
  <li>Place the wtms folder into the htdocs directory (e.g., C:\xampp\htdocs) in XAMPP.</li>
</ul>

<p><strong>5.2 Database Setup:</strong></p>
<ul>
  <li>Open phpMyAdmin.</li>
  <li>Create a new database named wtms_db.</li>
  <li>Import the workers.sql file located in …\database.</li>
</ul>

<p><strong>5.3 Update Config URL:</strong></p>
<ul>
  <li>In …\lib\service\config.dart, update the server URL to: http://{your-ip-address}/wtms.</li>
</ul>

<p><strong>5.4 Flutter Setup:</strong></p>
<ul>
  <li>Open terminal in the project directory.</li>
  <li>Run the command: flutter pub get to install dependencies.</li>

      flutter pub get
</ul>

<p><strong>5.5 Run the App:</strong></p>
<ul>
  <li>Press F5 in your code editor (e.g., VS Code), or</li>
  <li>Run flutter run in the terminal.</li>

      flutter run
</ul>




