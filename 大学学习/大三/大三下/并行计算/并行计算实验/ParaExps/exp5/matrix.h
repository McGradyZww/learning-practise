#pragma once
#include <iostream>
#include <cstring>

struct Matrix
{
public:
    Matrix()
    {
        mpData = 0;
        mM = 0; mN = 0;
    }
    Matrix(const Matrix &from)
    {
        this->resize(from.mM, from.mN);
        memcpy(mpData, from.mpData, mM*mN*sizeof(double));
    }
    ~Matrix()
    {
        if (mpData)
        {
            delete[] mpData;
        }
    }
    const Matrix &operator = (const Matrix &right)
    {
        std::cout << "operator = echoed" << std::endl;
        this->resize(right.mM, right.mN);
        memcpy(mpData, right.mpData, mM*mN*sizeof(double));
        return *this;
    }
    void resize(int m, int n)
    {
        if (mpData)
        {
            delete[] mpData;
        }
        mpData = new double[m*n];
        mM = m; mN = n;
    }
    double &theElem(int i, int j)
    {
        return mpData[i*mN+j];
    }
    double getElem(int i, int j) const
    {
        return mpData[i*mN+j];
    }
    double *theAddress(int i, int j)
    {
        return mpData+i*mN+j;
    }
    void print(std::ostream &os = std::cout) const
    {
        for (int i=0; i<mM; i++)
        {
            for (int j=0; j<mN; j++)
            {
                os.width(8);
                os.precision(3);
                os.setf(std::ios::fixed);
                os << getElem(i,j);
            }
            os << std::endl;
        }
    }
    const Matrix getTransposed(void) const
    {
        Matrix tmp;
        tmp.resize(mN, mM);
        for (int i=0; i<mM; i++)
        {
            for (int j=0; j<mN; j++)
            {
                tmp.theElem(j,i) = this->getElem(i,j);
            }
        }
        return tmp;
    }
    double *mpData;
    int mM;
    int mN;
};

