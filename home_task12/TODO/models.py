from sqlalchemy import Column, Integer, String, Enum, DateTime
from sqlalchemy.sql import func
from database import Base
from enum import Enum as PyEnum

class TodoStatus(PyEnum):
    new = "new"
    in_progress = "in_progress"
    completed = "completed"

class TodoItemModel(Base):
    __tablename__ = "todo_items"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    title = Column(String, index=True)
    description = Column(String, index=True)
    status = Column(Enum(TodoStatus, name='todo_status'), default=TodoStatus.new)
    updated_at = Column(DateTime(timezone=True), onupdate=func.now(), default=func.now())