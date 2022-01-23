<template>
  <Header
    @toggle-add-task="toggleAddTask"
    title="Task Tracker"
    :showAddTask="showAddTask"
  />
  <div v-show="showAddTask">
    <AddTask @add-task="addTask" />
  </div>
  <Tasks
    @delete-task="deleteTask"
    @toggle-reminder="toggleReminder"
    :tasks="tasks"
  />
</template>

<script>
import Header from './components/Header'
import Tasks from './components/Tasks'
import AddTask from './components/AddTask'

export default {
  name: 'App',
  components: {
    Header,
    Tasks,
    AddTask
  },
  data () {
    return {
      tasks: [],
      showAddTask: false
    }
  },
  methods: {
    addTask (task) {
      this.tasks = [...this.tasks, task]
    },
    toggleAddTask () {
      this.showAddTask = !this.showAddTask
    },
    deleteTask (id) {
      if (confirm('are you sure?')) {
        this.tasks = this.tasks.filter((task) => task.id !== id)
      }
    },
    toggleReminder (id) {
      this.tasks = this.tasks.map((task) => task.id === id
        ? { ...task, reminder: !task.reminder } : task)
    },
    async fetchTasks () {
      const res = await fetch('http://localhost:5000/tasks')
      const data = await res.json()
      return data
    }
  },
  async created () {
    this.tasks = await this.fetchTasks()
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
