from django.urls import path
from . import views
from .views import Tasks, AddTask, TaskDetail, UpdateTask, DeleteTask

urlpatterns = [
    path('', Tasks.as_view(), name='tasks'),
    path('addTask/', AddTask.as_view(), name='addTask'),
    path('tasks/<int:pk>/', TaskDetail.as_view(), name='taskDetail'),
    path('updateTask/<int:pk>/', UpdateTask.as_view(), name='updateTask'),
    path('deleteTask/<int:pk>/', DeleteTask.as_view(), name='deleteTask'),
]