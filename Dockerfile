FROM python:3.13-slim

RUN addgroup --system nonroot && adduser --system --no-create-home --disabled-password --group nonroot

RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

COPY src /src
WORKDIR /src

RUN chown -R nonroot:nonroot /src
USER nonroot

RUN python manage.py collectstatic --noinput

ENV DJANGO_DEBUG_FALSE=1
CMD ["gunicorn", "--bind", ":8888", "superlists.wsgi:application"]