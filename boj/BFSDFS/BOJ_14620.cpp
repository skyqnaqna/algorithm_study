/*----------------------
|백준 14620 꽃길
|21.01.26
----------------------*/

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int n;
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};
int graph[10][10];
bool visit[10][10] = {false};
bool combiCheck[100] = {false};

vector <vector <int> > combi;

void combinations(int v, int cnt)
{
    if (cnt == 3)
    {
        vector <int> temp;
        for (int i = 0; i < (n-2) * (n-2); ++i)
        {
            if (combiCheck[i]) 
            {
                temp.push_back(i);
            }
        }
        combi.push_back(temp);
        temp.clear();
        return;
    }
    
    for (int i = v; i < (n-2) * (n-2); ++i)
    {
        if (!combiCheck[i])
        {
            combiCheck[i] = true;
            combinations(v+1, cnt + 1);
            combiCheck[i] = false;
        }
    }
    return;
}

int main()
{
    scanf("%d", &n);
    for (int i = 0; i < n; ++i)
        for(int j = 0; j < n; ++j)
            scanf("%d", &graph[i][j]);

    vector <int> center; // 꽃의 중앙이 될 수 있는 칸의 번호
    for (int i = 0; i < (n-2)*(n-2); ++i)
        center.push_back(i);

    fill_n(combiCheck, 100, false);

    combinations(0,0);
    vector <int> ans;

    for (int i = 0; i < combi.size(); ++i)
    {
        int cost = 0;
        fill(&visit[0][0], &visit[9][10], false);
        bool flag = true; // 꽃을 심을 수 있으면 참
        for (int j = 0; j < 3; ++j)
        {
            int k = combi[i][j];
            int r = k / (n-2) + 1;
            int c = k % (n-2) + 1;

            if (!visit[r][c])
            {
                cost += graph[r][c];
                for (int i = 0; i < 4; ++i)
                {
                    int nr = r + dy[i];
                    int nc = c + dx[i];
                    if (!visit[nr][nc])
                    {
                        visit[nr][nc] = true;
                        cost += graph[nr][nc];
                    }
                    else
                    {
                        flag = false;
                        break;
                    }
                }
            }
            else
            {
                flag = false;
                break;
            }
            if (!flag) break;
        }
        if (flag)
            ans.push_back(cost);
    }

    int result = *min_element(ans.begin(), ans.end());
    printf("%d\n", result);

    return 0;
}