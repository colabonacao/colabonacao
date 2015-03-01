using UnityEngine;

public class PieChartMeshController : MonoBehaviour
{
    PieChartMesh mPieChart;
    float[] mData;

    void Start()
    {
        mPieChart = gameObject.AddComponent("PieChartMesh") as PieChartMesh;
        if (mPieChart != null)
        {
            mPieChart.Init(mData, 100, 0, 80, null);
            mData = GenerateRandomValues(11);
            mPieChart.Draw(mData);
        }

    }

    void Update()
    {
    }

	public void setValues()
	{
		mData = GenerateRandomValues(11);
		mPieChart.Draw(mData);
	}

    float[] GenerateRandomValues(int length)
    {
        float[] targets = new float[length];

        for (int i = 0; i < length; i++)
        {
            targets[i] = Random.Range(0f, 100f);
        }
        return targets;
    }
}
