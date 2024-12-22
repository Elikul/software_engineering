from typing import List, Optional
from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from sqlalchemy.orm import Session
from database import SessionLocal, engine, Base
from models import  TodoItemModel, TodoStatus
from datetime import datetime

Base.metadata.create_all(bind=engine)

app = FastAPI()

class TodoCreate(BaseModel):
    title: str
    description: Optional[str] = None
    status: TodoStatus = TodoStatus.new

class TodoItem(BaseModel):
    id: int
    title: str
    description: Optional[str] = None
    status: TodoStatus
    updated_at: datetime

    class Config:
        orm_mode = True

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def check_item(item):
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")


@app.get("/items", response_model=List[TodoItem])
def get_items(db: Session = Depends(get_db)):
    items = db.query(TodoItemModel).all()
    return items


@app.get("/items/{item_id}", response_model=TodoItem)
def get_item(item_id: int, db: Session = Depends(get_db)):
    item = db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()

    check_item(item)

    return item

@app.post("/items", response_model=TodoItem)
def create_item(item: TodoCreate, db: Session = Depends(get_db)):
    new_item = TodoItemModel(
        title=item.title,
        description=item.description,
        status=item.status
    )
    db.add(new_item)
    db.commit()
    db.refresh(new_item)
    return new_item

@app.put("/items/{item_id}", response_model=TodoItem)
def update_item(item_id: int, item: TodoCreate, db: Session = Depends(get_db)):
    db_item = db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()

    check_item(db_item)

    db_item.title = item.title
    db_item.description = item.description
    db_item.status = item.status
    db.commit()
    db.refresh(db_item)
    return db_item


@app.delete("/items/{item_id}")
def delete_item(item_id: int, db: Session = Depends(get_db)):
    db_item = db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()

    check_item(db_item)

    db.delete(db_item)
    db.commit()
    return {"message": "Item deleted"}

@app.get("/items/status/{status}", response_model=List[TodoItem])
def get_items_by_status(status: TodoStatus, db: Session = Depends(get_db)):
    items = db.query(TodoItemModel).filter(TodoItemModel.status == status).all()
    return items

@app.put("/items/{item_id}/status", response_model=TodoItem)
def update_item_status(item_id: int, status: TodoStatus, db: Session = Depends(get_db)):
    db_item = db.query(TodoItemModel).filter(TodoItemModel.id == item_id).first()

    check_item(db_item)

    db_item.status = status
    db.commit()
    db.refresh(db_item)
    return db_item