FROM python:3.9-slim
WORKDIR /app
COPY echo.py /app/echo.py
RUN pip install flask
EXPOSE 7600
CMD ["python3", "echo.py"]