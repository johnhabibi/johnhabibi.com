# John Habibi - Personal Website

A modern, elegant personal website showcasing my work across multiple creative disciplines: writing, photography, music, and app development.

## 🎯 Overview

This website serves as my digital presence and portfolio, built with a focus on clean design, thoughtful user experience, and meaningful content presentation.

## ✨ Features

- **Elegant Design**: Minimalist dark theme with sophisticated typography
- **Responsive Layout**: Optimized for desktop and mobile devices
- **Contact Form**: Functional contact system with form validation
- **Photography Gallery**: Professional photo management with Active Storage
  - Bulk photo upload capability
  - Category filtering and organization
  - Responsive image variants (WebP optimization)
  - Lightbox viewing experience
  - Admin interface with HTTP Basic Authentication
- **Portfolio Sections**:
  - 📝 **Writing**: Newsletter integration and featured articles
  - 📸 **Photography**: Visual portfolio and gallery
  - 🎵 **Music**: Audio player and streaming platform links
  - 💻 **Development**: App portfolio and technical projects
  - 👤 **Biography**: Professional overview and downloadable bio

## 🛠 Tech Stack

- **Backend**: Ruby on Rails 7.2
- **Database**: PostgreSQL
- **Styling**: Tailwind CSS
- **JavaScript**: Stimulus + Turbo
- **Deployment**: Ready for Heroku, Railway, or similar platforms

## 🚀 Getting Started

### Prerequisites

- Ruby 3.3.0 or higher
- PostgreSQL
- Node.js (for Tailwind CSS)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/johnhabibi/johnhabibi.com.git
   cd johnhabibi.com
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   ```

5. **Set up environment variables for admin access**
   ```bash
   cp .env.example .env
   # Edit .env and set your admin credentials:
   # ADMIN_USERNAME=your_username
   # ADMIN_PASSWORD=your_secure_password
   ```

6. **Start the development server**
   ```bash
   bin/dev
   ```

7. **Visit the application**
   ```
   http://localhost:3000
   ```

## 🔐 Admin Authentication

The photography admin interface is protected by HTTP Basic Authentication:

- **Admin URL**: `/admin/photos`
- **Default credentials** (development):
  - Username: `admin` 
  - Password: `admin123`
- **Production**: Set `ADMIN_USERNAME` and `ADMIN_PASSWORD` environment variables
- **Features**:
  - Single photo upload with metadata
  - Bulk photo upload with drag & drop
  - Photo management (edit, delete, categorize)
  - Category filtering and organization

## 🎨 Design Philosophy

This website embodies a philosophy of digital minimalism and intentional design:

- **Content First**: Clean layouts that prioritize content readability
- **Performance**: Optimized for fast loading and smooth interactions
- **Accessibility**: Semantic HTML and keyboard navigation support
- **Responsive**: Mobile-first design approach

## 🔧 Configuration

### Environment Variables

Create a `.env` file for local development:

```env
DATABASE_URL=postgresql://username:password@localhost/johnhabibi_com_development
```

## 🚢 Deployment

This application is ready for deployment on:

- **Heroku**: Includes `Procfile.dev` and PostgreSQL configuration
- **Railway**: Works out of the box with PostgreSQL
- **DigitalOcean App Platform**: Compatible with Rails apps

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 📬 Contact

- **Website**: [johnhabibi.com](https://johnhabibi.com)
- **Email**: Use the contact form on the website
- **GitHub**: [@johnhabibi](https://github.com/johnhabibi)

---

Built with ❤️ using Ruby on Rails and Tailwind CSS
