#include <string>
#include <vector>

using namespace std;

int solution(int n, vector<int> lost, vector<int> reserve) 
{
    int answer = n;
    vector <int> students (n+1, 1);

    for (int i = 0; i < lost.size(); ++i)
    {
        students[lost[i]]--;
    }
    for (int i = 0; i < reserve.size(); ++i)
    {
        students[reserve[i]]++;
    }

    // 빌릴 수 있으면 빌리기
    for (int i = 0; i < lost.size(); ++i)
    {
        int k = lost[i];
        if (students[k] == 0)
        {
            if (k - 1 > 0 && students[k - 1] > 1) // 앞사람한테 빌리기
            {
                students[k]++;
                students[k - 1]--;
            }
            else if (k + 1 <= n && students[k + 1] > 1) // 뒷사람한테 빌리기
            {
                students[k]++;
                students[k + 1]--;
            }
            else answer--;
        }
    }

    return answer;
}
