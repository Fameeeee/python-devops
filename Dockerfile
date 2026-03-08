# ใช้ Image ขนาดเล็ก ลดพื้นที่โจมตี (Attack Surface)
FROM python:3.11-slim

# ป้องกัน Python เขียนไฟล์ .pyc และบังคับให้ log ออก console ทันที
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# กฎเหล็ก DevSecOps: สร้าง User ใหม่ ห้ามใช้ Root รันแอปเด็ดขาด
RUN adduser --disabled-password --gecos '' appuser

# ตั้งค่า Directory ทำงาน
WORKDIR /app

# ก๊อปปี้ไฟล์ dependencies และติดตั้งก่อนเพื่อใช้ประโยชน์จาก Docker Cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ก๊อปปี้โค้ดทั้งหมด และเปลี่ยนสิทธิ์เจ้าของไฟล์ให้เป็นของ appuser
COPY --chown=appuser:appuser . .

# สลับจาก Root ไปใช้ User ธรรมดาที่เพิ่งสร้าง
USER appuser

# เปิด Port 
EXPOSE 8000

# รัน Server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]