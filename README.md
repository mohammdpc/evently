# 🎉 Evently — Flutter Event Planning App

A cross‑platform event planning app built with Flutter. Users can sign up, create and categorize their own events, mark favourites, and switch between light/dark themes and English/Arabic at any time. Events are stored per‑user in the cloud via Firebase, so they sync in real time.

---

## 📸 Screenshots

### Onboarding — Personalize Your Experience

<table>
<tr>
<td align="center"><img src="screenshots/intro%201%20light.png" width="220"></td>
<td align="center"><img src="screenshots/intro%201%20arabic.png" width="220"></td>
</tr>
</table>

The very first screen the app shows. Before going any further, the user picks a **Language** (English/Arabic) and a **Theme** (Light/Dark) so the rest of the onboarding and app already reflects their preference. A **Let's Start** button moves into the onboarding slides.

---

### Onboarding — "Find Events That Inspire You"

<table>
<tr>
<td align="center"><img src="screenshots/intro%202%20light.png" width="220"></td>
<td align="center"><img src="screenshots/intro%202%20dark.png" width="220"></td>
</tr>
</table>

The first of three swipeable onboarding slides, introducing the app's core idea: curated events matched to the user's interests (live music, art workshops, networking, etc.).

---

### Onboarding — "Effortless Event Planning"

<table>
<tr>
<td align="center"><img src="screenshots/intro%203%20light.png" width="220"></td>
<td align="center"><img src="screenshots/intro%203%20dark.png" width="220"></td>
</tr>
</table>

The second slide, highlighting the all‑in‑one planning tools — creating events, setting reminders, and keeping details organized in one place.

---

### Onboarding — "Connect with Friends & Share Moments"

<table>
<tr>
<td align="center"><img src="screenshots/intro%204%20light.png" width="220"></td>
<td align="center"><img src="screenshots/intro%204%20dark.png" width="220"></td>
</tr>
</table>

The final slide, focused on the social side of the app — inviting friends and sharing moments from an event. From here, **Get Started** takes the user to Login.

---

### Login

<table>
<tr>
<td align="center"><img src="screenshots/login%20light.png" width="220"></td>
<td align="center"><img src="screenshots/login%20dark.png" width="220"></td>
</tr>
</table>

Email/password sign‑in backed by Firebase Authentication, with inline validation (empty fields, invalid email format, minimum password length), a **Forget Password?** link, a link to Sign Up, and a (currently front‑end‑only) **Sign up with Google** button.

---

### Sign Up

<table>
<tr>
<td align="center"><img src="screenshots/signup%20light.png" width="220"></td>
<td align="center"><img src="screenshots/signup%20dark.png" width="220"></td>
</tr>
</table>

Creates a new account with name, email, and a confirmed password (with show/hide toggles on both password fields). On success, the account is created in Firebase Authentication and the user is taken straight into the app.

---

### Home — Event Feed

<table>
<tr>
<td align="center"><img src="screenshots/home%20light.png" width="220"></td>
<td align="center"><img src="screenshots/home%20dark.png" width="220"></td>
</tr>
<tr>
<td align="center" colspan="2"><img src="screenshots/home%20categories.png" width="220"></td>
</tr>
</table>

The main screen after logging in. Greets the user by name, and offers quick‑access toggles for theme and language right in the header. Events are organized into scrollable category tabs — **All, Sport, Birthday, Meeting, Exhibition, Book Club** — with each event shown as a card carrying its date, description, and a tap‑to‑toggle favourite heart icon. Tapping a card opens a full event‑details view with edit and delete actions.

---

### Add Event

<table>
<tr>
<td align="center"><img src="screenshots/add%20event%20light.png" width="220"></td>
<td align="center"><img src="screenshots/add%20event%20dark.png" width="220"></td>
</tr>
</table>

Opened from the floating **+** button on Home. Lets the user pick a category, enter a title and description, and choose a date and time via native date/time pickers. The same screen doubles as the **edit** form when reopened on an existing event.

---

### Favourites

<table>
<tr>
<td align="center"><img src="screenshots/favourite%20light.png" width="220"></td>
<td align="center"><img src="screenshots/favourite%20dark.png" width="220"></td>
</tr>
</table>

Shows every event the user has hearted as a favourite. Includes a search field that filters across **all** of the user's events (not just favourites) by title or description as soon as text is entered.

---

### Profile

<table>
<tr>
<td align="center"><img src="screenshots/profile%20light.png" width="220"></td>
<td align="center"><img src="screenshots/profile%20dark.png" width="220"></td>
</tr>
</table>

Shows the user's avatar, name, and email, with settings tiles for toggling **Dark Mode**, switching **Language**, and **Logging Out** (which clears the saved session and returns to Login).

---

## 🧱 Technical Details

### Packages

| Package | Purpose |
|---|---|
| `provider` | State management throughout the app via `ChangeNotifier` cubits |
| `firebase_core` | Initializes the Firebase app instance |
| `firebase_auth` | Email/password authentication (sign up, log in, sign out) |
| `cloud_firestore` | Stores and streams each user's events in real time |
| `shared_preferences` | Persists theme, language, onboarding‑seen, and session state on‑device |
| `flutter_localizations` / `intl` | Powers English/Arabic localization and date formatting |
| `smooth_page_indicator` | Animated dots for the onboarding slide carousel |
| `fluttertoast` | Toast notifications for user feedback |

Dart SDK constraint (from `pubspec.yaml`): `^3.10.7`

### Backend

The app is powered by **Firebase**:

- **Authentication** — `LoginProvider` (`lib/Providers/login_provider.dart`) wraps `FirebaseAuth` calls for sign‑up, sign‑in, and sign‑out.
- **Cloud Firestore** — each user's events live under `users/{userID}/events` as a subcollection. `MainScreen` opens a live `StreamBuilder` on that collection, so any add, edit, delete, or favourite‑toggle is reflected instantly across the UI without a manual refresh.
- Event documents are (de)serialized through the `Event` model (`lib/models/event.dart`), and basic user info (name) is stored under `users/{userID}` via the `UserModel` (`lib/models/user.dart`).

### Code Architecture

- **State management** is Provider‑based, with two main `ChangeNotifier`s:
  - `SettingsProvider` — owns theme, language, onboarding‑seen flag, and the current signed‑in user, persisting each to `SharedPreferences` so they survive app restarts.
  - `LoginProvider` — handles the Firebase Auth calls triggered from the Login/Sign Up screens.
- **Navigation** is done with straightforward `MaterialPageRoute` pushes; `main.dart` decides the initial route (`Onboarding` → `Login` → `MainScreen`) based on `SettingsProvider` state.
- **Folder structure** mirrors the user flow:

```
lib/
├── Onboarding/          # Personalize screen + 3-slide carousel
├── Authentication/      # Login, Sign Up, Forget Password
├── Main Screens/        # Home, Add Event, Favourite, Profile, bottom-nav shell
├── Secondary Screens/   # Event details, Edit event
├── General Widgets/     # Shared building blocks (event_card, input_field, tab_card, etc.)
├── Providers/           # SettingsProvider, LoginProvider
├── models/              # Event, UserModel
├── l10n/                # English + Arabic .arb translation files
├── theme.dart           # Light/Dark ThemeData
└── main.dart            # App entry point, Firebase init, providers setup
```

- **Localization** is generated from `lib/l10n/app_en.arb` and `app_ar.arb` via Flutter's built‑in `gen-l10n` tooling (`generate: true` in `pubspec.yaml`), so every user‑facing string in the screens above is swappable between English and Arabic.

### Supported Platforms

The repository contains platform scaffolding for **Android, Linux, and Web** (folders `android/`, `linux/`, `web/`).
