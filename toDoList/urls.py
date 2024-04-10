from django.urls import path
from . import views
from .views import Tasks, AddTask, TaskDetail

urlpatterns = [
    path('', Tasks.as_view(), name='tasks'),
    path('addTask/', AddTask.as_view(), name='addTask'),
    path('tasks/<int:pk>/', TaskDetail.as_view(), name='taskDetail'),
]