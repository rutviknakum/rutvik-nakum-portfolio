# 🎓 Rutvik B. Nakum — Portfolio

<div align="center">






**Assistant Professor · Flutter Developer · DA-IICT Graduate**

[🌐 Live Demo](https://rutviknakum.github.io/rutvik-nakum-portfolio) · [📧 Email](mailto:rutvikb.nakum21@gmail.com) · [💼 LinkedIn](https://linkedin.com/in/rutviknakum) · [🎓 Google Scholar](https://scholar.google.com)

</div>

***

## 👨‍💻 About

Personal portfolio website built with **Flutter Web** — showcasing academic background, industry experience, projects, skills, and contact information.

Currently serving as **Assistant Professor** at ITM SLS Baroda University, teaching OOP (Java) and Computer Networks to UG & PG students. MSc IT graduate from **DA-IICT, Gandhinagar**.

***

## ✨ Features

- ⚡ **Flutter Web** — Fast, responsive cross-platform UI
- 🎨 **Dark Theme** — Professional dark color scheme with Cyan accent
- 📱 **Fully Responsive** — Mobile, Tablet & Desktop layouts
- 🎞️ **Smooth Animations** — `animate_do` powered entrance animations
- 📬 **Contact Form** — Direct email integration via `url_launcher`
- 🗂️ **Project Filter** — Filter by Academic / Personal projects
- 🧑‍🏫 **Experience Timeline** — Interactive vertical timeline
- 🔗 **Social Links** — LinkedIn, GitHub, Google Scholar

***

## 🗂️ Project Structure

```
my_portfolio/
├── lib/
│   ├── main.dart
│   ├── constants/
│   │   ├── app_colors.dart
│   │   └── app_strings.dart
│   ├── data/
│   │   └── projects_data.dart
│   ├── sections/
│   │   ├── hero_section.dart
│   │   ├── about_section.dart
│   │   ├── skills_section.dart
│   │   ├── projects_section.dart
│   │   └── contact_section.dart
│   └── widgets/
│       ├── nav_bar.dart
│       ├── section_title.dart
│       └── project_card.dart
├── web/
│   ├── index.html
│   └── manifest.json
├── assets/
│   └── images/
│       └── profile_photo.jpg
└── pubspec.yaml
```

***

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter 3.x (Web) |
| **Language** | Dart |
| **Animations** | animate_do |
| **Fonts** | Google Fonts (Poppins, Roboto) |
| **URL Handling** | url_launcher |
| **Backend (Projects)** | Firebase, PostgreSQL |

***

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Chrome browser (for web)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/rutviknakum/rutvik-nakum-portfolio.git

# 2. Navigate to project
cd rutvik-nakum-portfolio

# 3. Install dependencies
flutter pub get

# 4. Run on Chrome
flutter run -d chrome
```

### Build for Production

```bash
flutter build web --release
```

Output → `build/web/` folder

***

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
  animate_do: ^3.3.4
  url_launcher: ^6.2.5
```

***

## 📁 Sections

| Section | Description |
|---|---|
| **Hero** | Name, title, CTA buttons, social links, profile photo |
| **About** | Bio, education, interests, experience timeline |
| **Skills** | Flutter, Firebase, Java, Dart, PostgreSQL, etc. |
| **Projects** | Filterable project cards (Academic / Personal) |
| **Contact** | Contact form + info cards + social chips |

***

## 🎨 Color Palette

| Color | Hex | Usage |
|---|---|---|
| Background | `#0d1117` | Main background |
| Surface | `#161b22` | Cards, sections |
| Primary (Cyan) | `#00BCD4` | Accent, highlights |
| Text Primary | `#e6edf3` | Headings |
| Text Secondary | `#8b949e` | Body text |

***

## 📬 Contact

**Rutvik B. Nakum**
- 📧 Email: [rutvikb.nakum21@gmail.com](mailto:rutvikb.nakum21@gmail.com)
- 📍 Location: Vadodara, Gujarat, India
- 🏫 ITM SLS Baroda University

***

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

***

<div align="center">
Made with ❤️ using Flutter Web
</div>
