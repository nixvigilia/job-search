<template lang="">
  <div>
      <title-bar :title-stack="titleStack" />
  <hero-bar>Dashboard</hero-bar>
  <main-section>
    <notification
      color="info"
      :icon="mdiGithub"
    >
      Please star this project on
      <a
        href="https://github.com/justboil/admin-one-vue-tailwind"
        class="underline"
        target="_blank"
      >GitHub</a>
      <template #right>
        <jb-button
          href="https://github.com/justboil/admin-one-vue-tailwind"
          :icon="mdiGithub"
          :outline="darkMode"
          label="GitHub"
          target="_blank"
          small
        />
      </template>
    </notification>
    <div class="grid grid-cols-1 gap-6 lg:grid-cols-3 mb-6">
      <card-widget
        trend="12%"
        trend-type="up"
        color="text-emerald-500"
        :icon="mdiAccountMultiple"
        :number="512"
        label="Clients"
      />
      <card-widget
        trend="12%"
        trend-type="down"
        color="text-blue-500"
        :icon="mdiCartOutline"
        :number="7770"
        prefix="$"
        label="Sales"
      />
      <card-widget
        trend="Overflow"
        trend-type="alert"
        color="text-red-500"
        :icon="mdiChartTimelineVariant"
        :number="256"
        suffix="%"
        label="Performance"
      />
    </div>

    <div class="grid grid-cols-1 xl:grid-cols-2 gap-6 mb-6">
      <div class="flex flex-col justify-between">
        <card-transaction-bar
          v-for="(transaction,index) in transactionBarItems"
          :key="index"
          :amount="transaction.amount"
          :date="transaction.date"
          :business="transaction.business"
          :type="transaction.type"
          :name="transaction.name"
          :account="transaction.account"
        />
      </div>
      <div class="flex flex-col justify-between">
        <card-client-bar
          v-for="client in clientBarItems"
          :key="client.id"
          :name="client.name"
          :login="client.login"
          :date="client.created"
          :progress="client.progress"
        />
      </div>
    </div>

    <title-sub-bar
      :icon="mdiChartPie"
      title="Trends overview"
    />

    <card-component
      title="Performance"
      :icon="mdiFinance"
      :header-icon="mdiReload"
      class="mb-6"
      @header-icon-click="fillChartData"
    >
      <div v-if="chartData">
        <line-chart
          :data="chartData"
          class="h-96"
        />
      </div>
    </card-component>

    <title-sub-bar
      :icon="mdiAccountMultiple"
      title="Clients"
    />

    <notification
      color="info"
      :icon="mdiMonitorCellphone"
    >
      <b>Responsive table.</b> Collapses on mobile
    </notification>

    <card-component
      :icon="mdiMonitorCellphone"
      title="Responsive table"
      has-table
    >
      <clients-table />
    </card-component>
  </main-section>
  </div>
</template>
<script>
export default {};
</script>

