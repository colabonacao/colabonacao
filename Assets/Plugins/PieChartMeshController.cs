using UnityEngine;

public class PieChartMeshController : MonoBehaviour
{
    PieChartMesh mPieChart;
    float[] mData;

    void Awake()
    {
        mPieChart = gameObject.AddComponent("PieChartMesh") as PieChartMesh;
        if (mPieChart != null)
        {
			mPieChart.Init(mData, 100, 0, 100, null);
			float x = (float)Mathf.Min(Screen.width/800.0f,Screen.height/600.0f);
			gameObject.transform.localScale = new Vector3(x,x,0);
            mData = GenerateRandomValues(11);
            mPieChart.Draw(mData);
        }

    }

    void Update()
    {
    }

	public void setValues(float[] mData)
	{
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
