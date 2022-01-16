<script>
import { defineComponent } from 'vue'
import {Line } from 'vue3-chart-v2'

export default defineComponent({
  name: 'LineChart',
  extends: Line,

  props: {
    chartData: {
      type: Object,
      required: true
    },
    chartOptions: {
      type: Object,
      required: false
    },
    update: {
      type: Number
    },
  },
  mounted () {
      //ໃຫ້ລະບົບ render ເວລາໂຫລດໂມດຸນ
      this.renderChart(this.chartData, this.chartOptions)
  },
  watch: {
      // ສ້າງຟັງຊັ່ນຢູ່ watch ເພື່ອອັບເດດ Chart ກໍລະນີມີການອັບເດດ
    update: {
      handler: function () {
        this._chart.destroy();
        this.renderChart(this.chartData, this.chartOptions)
      }
    }
  }
})
</script>