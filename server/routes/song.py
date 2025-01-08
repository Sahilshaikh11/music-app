import os
import uuid
import cloudinary
from dotenv import load_dotenv
from fastapi import APIRouter, Depends, File, Form, UploadFile
from sqlalchemy.orm import Session
from database import get_db
from middleware.auth_middleware import auth_middleware
import cloudinary.uploader

from models.song import Song

load_dotenv()

api_secret = os.getenv("CLOUDINARY_API_KEY")

router = APIRouter()

cloudinary.config( 
    cloud_name = "dlsfr0ha6", 
    api_key = "142348264529635", 
    api_secret = api_secret, # Click 'View API Keys' above to copy your API secret
    secure=True
)

@router.post('/upload', status_code=201)
def upload_song(song: UploadFile = File(...), 
                thumbnail: UploadFile = File(...), 
                artist: str = Form(...), 
                song_name: str = Form(...), 
                hex_code: str = Form(...),
                db: Session = Depends(get_db),
                auth_dict = Depends(auth_middleware)):
    song_id = str(uuid.uuid4())
    song_res = cloudinary.uploader.upload(song.file, resource_type='auto', folder=f'songs/{song_id}')
    thumbnail_res = cloudinary.uploader.upload(thumbnail.file, resource_type='image', folder=f'songs/{song_id}')
    
    new_song = Song(
        id=song_id,
        song_name=song_name,
        artist=artist,
        hex_code=hex_code,
        song_url=song_res['url'],
        thumbnail_url = thumbnail_res['url'],
    )

    db.add(new_song)
    db.commit()
    db.refresh(new_song)
    return new_song

@router.get('/list')
def list_songs(db: Session = Depends(get_db), auth_details = Depends(auth_middleware)):
    songs = db.query(Song).all()
    return songs