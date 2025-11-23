# Dockerfile
# Використовуйте базовий образ Python
FROM python:3.11-slim

# Встановлюємо системні залежності для PostgreSQL та ін.
RUN apt-get update && apt-get install -y \
    postgresql-client \
    # Додаткові залежності для Beautiful Soup, якщо потрібні
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Встановлюємо робочий каталог
WORKDIR /app

# Копіюємо файл залежностей та встановлюємо їх
COPY requirements.txt /app/

RUN pip install --upgrade pip
# Встановлюємо всі залежності
RUN pip install -r requirements.txt

# Копіюємо решту коду
COPY . /app/