import { Add as AddIcon, Edit as EditIcon, Verified as VerifiedIcon } from '@mui/icons-material';
import { Box, IconButton, Tooltip, Typography } from '@mui/material';
import { useQuery } from '@tanstack/react-query';
import { useState } from 'react';
import { Link as RouterLink } from 'react-router-dom';
import { toast } from 'react-toastify';
import { getAllCustomers, verifyCustomer } from '../../api/customerService';
import { DataTable, PageHeader, StatusBadge, VerificationModal, ErrorDisplay } from '../../components/common';
import type { Column } from '../../components/common';
import { CustomerType } from '../../types';
import type { CustomerResponseDTO, CustomerVerificationDTO } from '../../types';

const CustomerList = () => {
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [sort, setSort] = useState<string | undefined>(undefined);
  const [verificationModal, setVerificationModal] = useState<{
    open: boolean;
    customerId: number | null;
  }>({
    open: false,
    customerId: null,
  });

  // Fetch customers
  const { data, isLoading, error, refetch } = useQuery({
    queryKey: ['customers', { page, size: rowsPerPage, sort }],
    queryFn: () => getAllCustomers(page, rowsPerPage, sort),
  });

  // Handle sort
  const handleSort = (field: string, direction: 'asc' | 'desc') => {
    setSort(`${field},${direction}`);
  };

  // Handle verify
  const handleOpenVerifyModal = (customerId: number) => {
    setVerificationModal({
      open: true,
      customerId,
    });
  };

  const handleCloseVerifyModal = () => {
    setVerificationModal({
      open: false,
      customerId: null,
    });
  };

  const handleVerify = async (verifierId: string) => {
    if (!verificationModal.customerId) return;

    try {
      const verificationData: CustomerVerificationDTO = { verifierId };
      await verifyCustomer(verificationModal.customerId, verificationData);
      toast.success('Customer verified successfully');
      refetch();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : 'Failed to verify customer');
      throw err; // Re-throw to let the modal component handle the error
    }
  };

  // Table columns
  const columns: Column<CustomerResponseDTO>[] = [
    { id: 'custId', label: 'ID', minWidth: 50, sortable: true },
    { id: 'extCustId', label: 'External ID', minWidth: 100, sortable: true },
    { 
      id: 'custType', 
      label: 'Type', 
      minWidth: 100,
      format: (value: CustomerType) => value
    },
    { 
      id: 'customerName', 
      label: 'Name', 
      minWidth: 170,
      format: (_, row: CustomerResponseDTO) => {
        if (row.custType === CustomerType.INDIVIDUAL) {
          return `${row.firstName || ''} ${row.lastName || ''}`.trim();
        } else {
          return row.tradeName || '';
        }
      }
    },
    { id: 'mobile', label: 'Mobile', minWidth: 120 },
    { 
      id: 'verified', 
      label: 'Status', 
      minWidth: 100,
      format: (value: boolean) => (
        <StatusBadge status={value ? 'VERIFIED' : 'PENDING'} />
      )
    },
    { 
      id: 'actions', 
      label: 'Actions', 
      minWidth: 100,
      format: (_, row: CustomerResponseDTO) => (
        <Box>
          <Tooltip title="Edit">
            <IconButton 
              component={RouterLink} 
              to={`/customers/${row.custId}`} 
              color="primary"
            >
              <EditIcon />
            </IconButton>
          </Tooltip>
          {!row.verified && (
            <Tooltip title="Verify">
              <IconButton 
                color="success" 
                onClick={() => handleOpenVerifyModal(row.custId)}
              >
                <VerifiedIcon />
              </IconButton>
            </Tooltip>
          )}
        </Box>
      )
    },
  ];

  return (
    <Box>
      <PageHeader
        title="Customer Management"
        buttonText="Add Customer"
        buttonLink="/customers/new"
        startIcon={<AddIcon />}
      />

      {error ? (
        <ErrorDisplay 
          error={error} 
          title="Error Loading Customers" 
          onRetry={refetch}
        />
      ) : (
        <DataTable
          columns={columns}
          rows={data?.content || []}
          totalItems={data?.totalElements || 0}
          page={page}
          rowsPerPage={rowsPerPage}
          onPageChange={setPage}
          onRowsPerPageChange={setRowsPerPage}
          onSort={handleSort}
          loading={isLoading}
          idField="custId"
        />
      )}

      <VerificationModal
        open={verificationModal.open}
        onClose={handleCloseVerifyModal}
        onVerify={handleVerify}
        title="Verify Customer"
        description="Please enter your user ID to verify this customer."
      />
    </Box>
  );
};

export default CustomerList;
