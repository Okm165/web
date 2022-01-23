<template>
    <div @dblclick="this.$emit('toggle-reminder', task.id)" :class="[task.reminder ? 'reminder' : '', 'task']">
        <h3>{{ task.text }}
            <i @click="this.$emit('delete-task', task.id)" class="fas fa-times"></i>
        </h3>
        <p>{{ task.day }}</p>
    </div>
</template>

<script>
export default {
  name: 'Task',
  props: {
    task: Object
  },
  emits: ['delete-task', 'toggle-reminder']
}
</script>

<style scoped>
    .task {
        background: #fafafa;
        margin: 5px;
        padding: 10px 20px;
        cursor: pointer;
        user-select: none;
    }
    .task.reminder {
        border-left: 5px solid tomato;
    }
    .task h3 {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .task h3 i {
        color: tomato;
    }
</style>
